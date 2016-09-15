defmodule TeamPlanner.TaskControllerTest do
  use TeamPlanner.ConnCase

  alias TeamPlanner.Task
  @valid_attrs %{date_delivery: %{day: 17, month: 4, year: 2010}, reference: "some content", title: "some content"}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, task_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    task = Repo.insert! %Task{}
    conn = get conn, task_path(conn, :show, task)
    assert json_response(conn, 200)["data"] == %{"id" => task.id,
      "reference" => task.reference,
      "title" => task.title,
      "dateDelivery" => task.date_delivery}
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, task_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, task_path(conn, :create), task: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(Task, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, task_path(conn, :create), task: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    task = Repo.insert! %Task{}
    conn = put conn, task_path(conn, :update, task), task: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Task, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    task = Repo.insert! %Task{}
    conn = put conn, task_path(conn, :update, task), task: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    task = Repo.insert! %Task{}
    conn = delete conn, task_path(conn, :delete, task)
    assert response(conn, 204)
    refute Repo.get(Task, task.id)
  end

  test "elm", %{conn: conn} do
    conn = delete conn, task_path(conn, :test)
    assert json_response(conn, 201)["hello", "world", "this", "is", "the", "best", "json", "ever"]
  end
end
