defmodule Linkshrinkex.Urls do
  import Ecto.Query, warn: false
  alias Linkshrinkex.Repo
  alias Linkshrinkex.Urls.Url

  def create_url(attrs \\ %{}) do
    %Url{}
    |> Url.changeset(attrs)
    |> generate_short_url()
    |> Repo.insert()
  end

  def get_url_by_short_url(short_url) do
    Repo.get_by(Url, short_url: short_url)
  end

  def increment_url_visit(%Url{} = url) do
    url
    |> Url.changeset(%{visits: url.visits + 1})
    |> Repo.update()
  end

  defp generate_short_url(changeset) do
    short_url = generate_unique_short_url()
    Ecto.Changeset.put_change(changeset, :short_url, short_url)
  end

  defp generate_unique_short_url do
    short_url = :crypto.strong_rand_bytes(6) |> Base.url_encode64() |> binary_part(0, 6)
    if Repo.get_by(Url, short_url: short_url), do: generate_unique_short_url(), else: short_url
  end
end
