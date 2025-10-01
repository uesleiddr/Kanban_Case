defmodule KanbanLive.Repo do
  use Ecto.Repo,
    otp_app: :kanban_live,
    adapter: Ecto.Adapters.Postgres
end
