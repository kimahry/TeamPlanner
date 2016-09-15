defmodule TeamPlanner.UserView do
  use TeamPlanner.Web, :view

  def render("index.json", %{users: users}) do
    %{data: render_many(users, TeamPlanner.UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, TeamPlanner.UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{id: user.id,
      username: user.username,
      password: user.password,
      name: user.name,
      lastname: user.lastname,
      email: user.email}
  end
end
