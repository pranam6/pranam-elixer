use Mix.Config

# Configure your database
config :linkshrinkex, Linkshrinkex.Repo,
  username: "postgres",
  password: "postgres",
  database: "linkshrinkex_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

config :linkshrinkex_web, LinkshrinkexWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure Phoenix to use the Jason library for JSON parsing
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
