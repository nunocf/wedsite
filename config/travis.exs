use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :wedsite, WedsiteWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :wedsite, Wedsite.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "wedsite",
  hostname: "db",
  pool: Ecto.Adapters.SQL.Sandbox
