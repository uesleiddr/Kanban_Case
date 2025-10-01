defmodule KanbanLive.BoardsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `KanbanLive.Boards` context.
  """

  @doc """
  Generate a workflow.
  """
  def workflow_fixture(attrs \\ %{}) do
    {:ok, workflow} =
      attrs
      |> Enum.into(%{
        description: "some description",
        name: "some name"
      })
      |> KanbanLive.Boards.create_workflow()

    workflow
  end

  @doc """
  Generate a stage.
  """
  def stage_fixture(attrs \\ %{}) do
    {:ok, stage} =
      attrs
      |> Enum.into(%{
        name: "some name",
        position: 42
      })
      |> KanbanLive.Boards.create_stage()

    stage
  end

  @doc """
  Generate a card.
  """
  def card_fixture(attrs \\ %{}) do
    {:ok, card} =
      attrs
      |> Enum.into(%{
        position: 42,
        title: "some title"
      })
      |> KanbanLive.Boards.create_card()

    card
  end
end
