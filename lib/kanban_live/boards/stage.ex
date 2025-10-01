defmodule KanbanLive.Boards.Stage do
  use Ecto.Schema
  import Ecto.Changeset

  schema "stages" do
    field(:name, :string)
    field(:position, :integer)

    belongs_to(:workflow, KanbanLive.Boards.Workflow)
    has_many(:cards, KanbanLive.Boards.Card)

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(stage, attrs) do
    stage
    |> cast(attrs, [:name, :position])
    |> validate_required([:name, :position])
  end
end
