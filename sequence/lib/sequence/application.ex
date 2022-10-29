defmodule Sequence.Application do
  use Application
  @server Sequence.Server

  @impl true
  def start(_type, _args) do
    children = [
      { @server, 123},
    ]
    opts = [strategy: :one_for_one, name: Sequence.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
