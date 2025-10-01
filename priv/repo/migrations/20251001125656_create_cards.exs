defmodule KanbanLive.Repo.Migrations.CreateCards do
  use Ecto.Migration

  def change do
    create table(:cards) do
      add :title, :string
      add :position, :integer
      add :stage_id, references(:stages, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:cards, [:stage_id])
  end
end
