defmodule LinkshrinkexWeb.UrlControllerTest do
  use LinkshrinkexWeb.ConnCase

  alias Linkshrinkex.Urls

  @create_attrs %{long_url: "https://example.com"}
  @invalid_attrs %{long_url: nil}

  describe "create url" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.url_path(conn, :create), url: @create_attrs)
      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.url_path(conn, :show, id)
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.url_path(conn, :create), url: @invalid_attrs)
      assert html_response(conn, 200) =~ "can't be blank"
    end
  end

  describe "show url" do
    test "redirects to long url", %{conn: conn} do
      {:ok, url} = Urls.create_url(@create_attrs)
      conn = get(conn, Routes.url_path(conn, :show, url.short_url))
      assert redirected_to(conn) == url.long_url
    end
  end

  describe "stats url" do
    test "displays url statistics", %{conn: conn} do
      {:ok, url} = Urls.create_url(@create_attrs)
      conn = get(conn, Routes.url_path(conn, :stats, url.short_url))
      assert html_response(conn, 200) =~ "Visits: 0"
    end
  end
end
