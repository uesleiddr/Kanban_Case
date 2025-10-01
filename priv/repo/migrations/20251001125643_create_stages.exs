defmodule KanbanLive.Repo.Migrations.CreateStages do
  use Ecto.Migration

  def change do
    create table(:stages) do
      add :name, :string
      add :position, :integer
      add :workflow_id, references(:workflows, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:stages, [:workflow_id])
  end
end
