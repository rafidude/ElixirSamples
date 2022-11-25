defmodule Router do
  defmacro __using__(_opts) do
    quote do
      def init(options) do
        options
      end
      def call(conn, _opts) do
        route(conn.method, conn.path_info, conn)
      end
    end
  end
end

defmodule Helloplug do
  use Router
  def route("GET", ["users", user_id], conn) do
    conn |> Plug.Conn.send_resp(200, "You requested user #{user_id}")
  end
  def route(_method, _path, conn) do
    conn |> Plug.Conn.send_resp(404, "Couldn't find that page, sorry!")
  end
end

# defmodule Helloplug do
#   def init(default_opts) do
#     IO.puts "Starting hello plug"
#     default_opts
#   end

#   # def call(conn, _opts) do
#   #   IO.puts "saying hello!"
#   #   Plug.Conn.send_resp(conn, 200, "Hello world plug!")
#   # end

#   def call(conn, _opts) do
#     route(conn.method, conn.path_info, conn)
#   end

#   def route("GET", ["hello"], conn) do
#     # this route is for /hello
#     conn |> Plug.Conn.send_resp(200, "Hello, world!")
#   end

#   def route("GET", ["users", user_id], conn) do
#     # this route is for /users/<user_id>
#     conn |> Plug.Conn.send_resp(200, "You requested user #{user_id}")
#   end

#   def route(_method, _path, conn) do
#     # this route is called if no other routes match
#     conn |> Plug.Conn.send_resp(404, "Couldn't find that page, sorry!")
#   end
# end
