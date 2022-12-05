defmodule Api1.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      Api1Web.Telemetry,
      # Start the Ecto repository
      Api1.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Api1.PubSub},
      # Start the Endpoint (http/https)
      Api1Web.Endpoint
      # Start a worker by calling: Api1.Worker.start_link(arg)
      # {Api1.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Api1.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    Api1Web.Endpoint.config_change(changed, removed)
    :ok
  end
end
