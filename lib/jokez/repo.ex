defmodule Jokez.Repo do
  use Ecto.Repo,
    otp_app: :jokez,
    adapter: Ecto.Adapters.Postgres
end
