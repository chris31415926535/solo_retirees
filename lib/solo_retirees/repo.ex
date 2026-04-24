defmodule SoloRetirees.Repo do
  use Ecto.Repo,
    otp_app: :solo_retirees,
    adapter: Ecto.Adapters.Postgres
end
