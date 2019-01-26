defmodule Wedsite.Repo do
  use Ecto.Repo,
    otp_app: :wedsite,
    adapter: Ecto.Adapters.Postgres
end
