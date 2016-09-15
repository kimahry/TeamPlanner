# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     TeamPlanner.Repo.insert!(%TeamPlanner.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
TeamPlanner.Repo.insert!(%TeamPlanner.Task{title: "Générer la session", reference: "BC8058", date_delivery: %Ecto.Date{day: 30, month: 10, year: 2010, }})
TeamPlanner.Repo.insert!(%TeamPlanner.Task{title: "Créer la vue", reference: "BC8089", date_delivery: %Ecto.Date{day: 30, month: 10, year: 2010, }})
TeamPlanner.Repo.insert!(%TeamPlanner.Task{title: "Générer l'utilisateur ", reference: "BC8078", date_delivery: %Ecto.Date{day: 30, month: 10, year: 2010, }})