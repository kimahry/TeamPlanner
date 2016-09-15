defmodule TeamPlanner.TaskView do
  use TeamPlanner.Web, :view

  def render("index.json", %{tasks: tasks}) do
    %{data: render_many(tasks, TeamPlanner.TaskView, "task.json")}
  end

  def render("show.json", %{task: task}) do
    %{data: render_one(task, TeamPlanner.TaskView, "task.json")}
  end

  def render("task.json", %{task: task}) do
    %{id: task.id,
      reference: task.reference,
      title: task.title,
      dateDelivery: task.date_delivery}
  end
end
