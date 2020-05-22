# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :binaService,
  ecto_repos: [BinaService.Repo]

# Configures the endpoint
config :binaService, BinaServiceWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "qyyshAYYxSFzTGWQdHU4FJzAhuN/5plUCHIzqCG/MOsqAGBT05frWfR2uWNChZSi",
  render_errors: [view: BinaServiceWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: BinaService.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

#Configures the generators
config :binaService, :generators,
  migration: true,
  binary_id: true


# Guardian config
config :binaService, BinaService.Guardian,
issuer: "binaService",
secret_key: "xDM5ZwwKBlcnnN+aze2lnET3CIZNhAmTxc+MftWeg6h768TPg2P56TvqyK84mBLt"

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason


config :ex_twilio,
  # account_sid: System.get_env(“TWILIO_ACCOUNT_SID”),
  # auth_token: System.get_env(“TWILIO_AUTH_TOKEN”)
  account_sid: "ACad37fc3c115c79be9b73fc4f62535aef",
  auth_token: "_______$%÷345323"


# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
