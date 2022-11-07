defmodule People.Application do
  use Application

  @impl true
  def start(_type, _args) do
    children = [ People.ServiceRegistry ]

    opts = [strategy: :one_for_one, name: People.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
