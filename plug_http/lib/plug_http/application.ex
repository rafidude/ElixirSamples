defmodule PlugHttp.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application
  require Logger

  @impl true
  def start(_type, _args) do
    children = [
      {Plug.Cowboy, scheme: :http, plug: Example.SimpleRoutes, options: [port: cowboy_port()]}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: PlugHttp.Supervisor]
    Logger.info("Starting PlugHttp application...")
    Supervisor.start_link(children, opts)
  end

  # defp cowboy_port, do: Application.get_env(:plug_http, :cowboy_port, 8080)
  defp cowboy_port, do: Application.fetch_env!(:plug_http, :cowboy_port)
end
