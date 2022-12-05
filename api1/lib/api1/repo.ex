defmodule Api1.Repo do
  use Ecto.Repo,
    otp_app: :api1,
    adapter: Ecto.Adapters.Postgres
end
