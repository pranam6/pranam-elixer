defmodule LinkshrinkexWeb.Router do
  use LinkshrinkexWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", LinkshrinkexWeb do
    pipe_through :browser
    get "/", UrlController, :new
    post "/urls", UrlController, :create
    get "/:id", UrlController, :show
    get "/:id/stats", UrlController, :stats
  end
end
