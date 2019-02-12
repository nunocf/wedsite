# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :wedsite, Wedsite.Repo,
  database: "wedsite",
  username: "postgres",
  password: "postgres",
  hostname: "db"

config :wedsite, ecto_repos: [Wedsite.Repo]

# Configures the endpoint
config :wedsite, WedsiteWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "OAXKVPdDVEDLnGnam0mRGqSjVOMFwgUV6Isx3zCkkK2gimPA5XR5V3H7I2kKb3R0",
  render_errors: [view: WedsiteWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Wedsite.PubSub, adapter: Phoenix.PubSub.PG2]

config :wedsite, :generators,
  migration: true,
  binary_id: true,
  sample_binary_id: "111111"

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
