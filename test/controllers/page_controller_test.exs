defmodule TeamPlanner.PageControllerTest do
  use TeamPlanner.ConnCase

  test "GET /", %{conn: conn} do
    conn = get conn, "/"
    assert html_response(conn, 200) =~ "<div id=\"elm-target\"></div>"
  end
end
