# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :goodeats,
  ecto_repos: [Goodeats.Repo]

# Configures the endpoint
config :goodeats, GoodeatsWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "z4h34zS3dNOcC9+Xv1ZLzwAl+6msrC5Bh3bDZHLFb+R49Rv5sFVh7f5R2PmCwF6m",
  render_errors: [view: GoodeatsWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Goodeats.PubSub, adapter: Phoenix.PubSub.PG2],
  live_view: [
    signing_salt: System.get_env("SECRET_SALT")
  ]

config :ex_aws,
  access_key_id: System.get_env("AWS_ACCESS_KEY_ID"),
  secret_access_key: System.get_env("AWS_SECRET_ACCESS_KEY"),
  s3: [
    scheme: "https://",
    host: "goodeats.s3.amazonaws.com",
    region: "us-east-2"
  ]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

config :goodeats, GoodeatsWeb.Endpoint,
  live_view: [
    signing_salt: System.get_env("SECRET_SALT")
  ]
