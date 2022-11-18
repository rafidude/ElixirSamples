defmodule Formv.Repo do
  use Ecto.Repo,
    otp_app: :formv,
    adapter: Ecto.Adapters.Postgres
end
