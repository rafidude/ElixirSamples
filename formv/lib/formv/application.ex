defmodule Formv.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      FormvWeb.Telemetry,
      # Start the Ecto repository
      Formv.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Formv.PubSub},
      # Start Finch
      {Finch, name: Formv.Finch},
      # Start the Endpoint (http/https)
      FormvWeb.Endpoint
      # Start a worker by calling: Formv.Worker.start_link(arg)
      # {Formv.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Formv.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    FormvWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
