defmodule Linkshrinkex.Repo do
  use Ecto.Repo,
    otp_app: :linkshrinkex,
    adapter: Ecto.Adapters.Postgres
end
