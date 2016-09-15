defmodule TeamPlanner.TaskTest do
  use TeamPlanner.ModelCase

  alias TeamPlanner.Task

  @valid_attrs %{date_delivery: %{day: 17, month: 4, year: 2010}, reference: "some content", title: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Task.changeset(%Task{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Task.changeset(%Task{}, @invalid_attrs)
    refute changeset.valid?
  end
end
