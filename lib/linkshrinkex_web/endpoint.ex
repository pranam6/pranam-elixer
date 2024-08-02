defmodule LinkshrinkexWeb.Endpoint do
  use Phoenix.Endpoint, otp_app: :linkshrinkex_web

  socket "/socket", LinkshrinkexWeb.UserSocket,
    websocket: true,
    longpoll: false

  plug Plug.Static,
    at: "/",
    from: :linkshrinkex_web,
    gzip: false,
    only: ~w(css fonts images js favicon.ico robots.txt)

  plug Plug.RequestId
  plug Plug.Telemetry, event_prefix: [:phoenix, :endpoint]

  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Phoenix.json_library()

  plug Plug.MethodOverride
  plug Plug.Head
  plug Plug.Session, store: :cookie, key: "_linkshrinkex_web_key", signing_salt: "salt"

  plug LinkshrinkexWeb.Router
end
