defmodule Api1Web.HelloController do
  use Phoenix.Controller

  def index(conn, _params) do
    text conn, "API1 is live - #{Mix.env}"
  end
end
