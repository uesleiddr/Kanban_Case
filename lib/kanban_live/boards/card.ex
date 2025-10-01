defmodule KanbanLive.Boards.Card do
  use Ecto.Schema
  import Ecto.Changeset

  schema "cards" do
    field(:title, :string)
    field(:position, :integer)

    belongs_to(:stage, KanbanLive.Boards.Stage)

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(card, attrs) do
    card
    |> cast(attrs, [:title, :position])
    |> validate_required([:title, :position])
  end
end
