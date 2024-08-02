use Mix.Config

config :linkshrinkex,
  ecto_repos: [Linkshrinkex.Repo]

config :linkshrinkex_web, LinkshrinkexWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "SECRET_KEY_BASE",
  render_errors: [view: LinkshrinkexWeb.ErrorView, accepts: ~w(html json)],
  pubsub_server: Linkshrinkex.PubSub,
  live_view: [signing_salt: "SALT"]

config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

import_config "#{Mix.env()}.exs"
