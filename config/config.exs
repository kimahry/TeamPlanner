# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :teamPlanner,
  ecto_repos: [TeamPlanner.Repo]

# Configures the endpoint
config :teamPlanner, TeamPlanner.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "65xQNuBs4LoUpL9WRNsij1B0wKf7nu//t5Nk9HYQkkDjCK8CvAEn7JWw91XQ4AiC",
  render_errors: [view: TeamPlanner.ErrorView, accepts: ~w(html json)],
  pubsub: [name: TeamPlanner.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
