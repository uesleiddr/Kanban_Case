defmodule KanbanLive.Boards.Workflow do
  use Ecto.Schema
  import Ecto.Changeset

  schema "workflows" do
    field(:name, :string)
    field(:description, :string)

    has_many(:stages, KanbanLive.Boards.Stage)
    timestamps()
  end

  @doc false
  def changeset(workflow, attrs) do
    workflow
    |> cast(attrs, [:name, :description])
    |> validate_required([:name, :description])
  end
end
