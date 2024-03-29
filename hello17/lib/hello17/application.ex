defmodule Hello17.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      Hello17Web.Telemetry,
      # Start the Ecto repository
      Hello17.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Hello17.PubSub},
      # Start Finch
      {Finch, name: Hello17.Finch},
      # Start the Endpoint (http/https)
      Hello17Web.Endpoint
      # Start a worker by calling: Hello17.Worker.start_link(arg)
      # {Hello17.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Hello17.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    Hello17Web.Endpoint.config_change(changed, removed)
    :ok
  end
end
