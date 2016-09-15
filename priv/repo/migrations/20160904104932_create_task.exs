defmodule TeamPlanner.Repo.Migrations.CreateTask do
  use Ecto.Migration

  def change do
    create table(:tasks) do
      add :title, :string
      add :reference, :string
      add :date_delivery, :date

      timestamps()
    end

  end
end
