defmodule TeamPlanner.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :username, :string
      add :password, :string
      add :name, :string
      add :lastname, :string
      add :email, :string

      timestamps()
    end

  end
end
