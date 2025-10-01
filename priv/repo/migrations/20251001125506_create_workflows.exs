defmodule KanbanLive.Repo.Migrations.CreateWorkflows do
  use Ecto.Migration

  def change do
    create table(:workflows) do
      add :name, :string
      add :description, :text

      timestamps(type: :utc_datetime)
    end
  end
end
