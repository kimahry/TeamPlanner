defmodule TeamPlanner.PageController do
  use TeamPlanner.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
