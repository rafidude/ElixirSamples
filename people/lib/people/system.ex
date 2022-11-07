defmodule People.System do
  def start_link do
    Supervisor.start_link([People.ServiceRegistry], strategy: :one_for_one)
  end
end
