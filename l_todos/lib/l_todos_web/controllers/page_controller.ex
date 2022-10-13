defmodule LTodosWeb.PageController do
  use LTodosWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
