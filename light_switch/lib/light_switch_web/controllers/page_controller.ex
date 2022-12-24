defmodule LightSwitchWeb.PageController do
  use LightSwitchWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
