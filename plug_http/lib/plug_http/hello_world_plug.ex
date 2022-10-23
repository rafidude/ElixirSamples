defmodule Example.HelloWorldPlug do
  import Plug.Conn

  def init(options) do
    IO.puts "Starting Plug Cowboy server..."
    options
  end

  def call(conn, _opts) do
    conn
    |> put_resp_content_type("text/plain")
    |> send_resp(200, "Hello World12!\n")
  end
end
