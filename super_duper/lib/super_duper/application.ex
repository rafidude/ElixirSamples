defmodule SuperDuper.Application do
  use Application
  alias SuperDuper.Server

  @impl true
  def start(_type, _args) do
    IO.puts ">>>> Starting Super-duper Super-visor <<<<"
    # children = [
    #   %{id: :superdave, start: {Server, :start_link, [:superdave]}},
    #   %{id: :superman, start: {Server, :start_link, [:superman]}},
    #   %{id: :supermario, start: {Server, :start_link, [:supermario]}}
    # ]
    children = [
      {Server, :superdave},
      {Server, :superman},
      {Server, :supermario},
      {DynamicSupervisor,
        name: SuperDuper.DynamicSupervisor,
        strategy: :one_for_one
      }
    ]

    opts = [strategy: :rest_for_one, name: SuperDuper.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
