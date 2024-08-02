defmodule LinkshrinkexWeb.UrlView do
  use LinkshrinkexWeb, :view

  def render("show.json", %{url: url}) do
    %{short_url: url.short_url, long_url: url.long_url}
  end
end
