defmodule Sequence.Application do
  use Application

  @impl true
  def start(_type, _args) do
    children = [
      { Sequence.Server, 123},
    ]
    opts = [strategy: :one_for_one, name: Sequence.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
