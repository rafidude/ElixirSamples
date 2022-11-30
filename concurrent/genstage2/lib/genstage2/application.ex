defmodule Genstage2.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      {A, 0},
      {B, 2},
      Supervisor.child_spec({C, []}, id: :c1),
      Supervisor.child_spec({C, []}, id: :c2),
      Supervisor.child_spec({C, []}, id: :c3),
      Supervisor.child_spec({C, []}, id: :c4)
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Genstage2.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
