defmodule Sd.Repo do
  use Ecto.Repo,
    otp_app: :sd,
    adapter: Ecto.Adapters.Postgres
end
