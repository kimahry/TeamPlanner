defmodule TeamPlanner.Task do
  use TeamPlanner.Web, :model

  schema "tasks" do
    field :reference, :string
    field :title, :string
    field :date_delivery, Ecto.Date

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:reference, :title, :date_delivery])
    |> validate_required([:reference, :title, :date_delivery])
  end
end
