defmodule TeamPlanner.User do
  use TeamPlanner.Web, :model

  schema "users" do
    field :username, :string
    field :password, :string
    field :name, :string
    field :lastname, :string
    field :email, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:username, :password, :name, :lastname, :email])
    |> validate_required([:username, :password, :name, :lastname, :email])
  end
end
