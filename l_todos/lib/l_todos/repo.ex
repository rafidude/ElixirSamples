defmodule LTodos.Repo do
  use Ecto.Repo,
    otp_app: :l_todos,
    adapter: Ecto.Adapters.Postgres
end
