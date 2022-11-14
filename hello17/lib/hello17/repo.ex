defmodule Hello17.Repo do
  use Ecto.Repo,
    otp_app: :hello17,
    adapter: Ecto.Adapters.Postgres
end
