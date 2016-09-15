use Mix.Config

# In this file, we keep production configuration that
# you likely want to automate and keep it away from
# your version control system.
#
# You should document the content of this
# file or create a script for recreating it, since it's
# kept out of version control and might be hard to recover
# or recreate for your teammates (or you later on).
config :teamPlanner, TeamPlanner.Endpoint,
  secret_key_base: "8xavTgUSBHbs5PZOZWlnoJ7a9VxJbJHtkrWe9vQXfG2+Lgn6VyPk7IJVVSOTjaiQ"

# Configure your database
config :teamPlanner, TeamPlanner.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "teamplanner_prod",
  pool_size: 20
