defmodule Grobble.Repo do
  use Ecto.Repo,
    otp_app: :grobble,
    adapter: Ecto.Adapters.Postgres
end
