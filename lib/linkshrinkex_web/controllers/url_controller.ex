defmodule LinkshrinkexWeb.UrlController do
  use LinkshrinkexWeb, :controller

  alias Linkshrinkex.Urls
  alias Linkshrinkex.Urls.Url

  def new(conn, _params) do
    changeset = Urls.change_url(%Url{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"url" => url_params}) do
    case Urls.create_url(url_params) do
      {:ok, url} ->
        conn
        |> put_flash(:info, "Short URL created successfully.")
        |> redirect(to: Routes.url_path(conn, :show, url.short_url))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => short_url}) do
    case Urls.get_url_by_short_url(short_url) do
      nil ->
        send_resp(conn, :not_found, "Not Found")
      url ->
        Urls.increment_url_visit(url)
        redirect(conn, external: url.long_url)
    end
  end

  def stats(conn, %{"id" => short_url}) do
    case Urls.get_url_by_short_url(short_url) do
      nil ->
        send_resp(conn, :not_found, "Not Found")
      url ->
        render(conn, "stats.html", url: url)
    end
  end
end
