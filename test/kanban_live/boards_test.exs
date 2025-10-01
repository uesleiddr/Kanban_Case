defmodule KanbanLive.BoardsTest do
  use KanbanLive.DataCase

  alias KanbanLive.Boards

  describe "workflows" do
    alias KanbanLive.Boards.Workflow

    import KanbanLive.BoardsFixtures

    @invalid_attrs %{name: nil, description: nil}

    test "list_workflows/0 returns all workflows" do
      workflow = workflow_fixture()
      assert Boards.list_workflows() == [workflow]
    end

    test "get_workflow!/1 returns the workflow with given id" do
      workflow = workflow_fixture()
      assert Boards.get_workflow!(workflow.id) == workflow
    end

    test "create_workflow/1 with valid data creates a workflow" do
      valid_attrs = %{name: "some name", description: "some description"}

      assert {:ok, %Workflow{} = workflow} = Boards.create_workflow(valid_attrs)
      assert workflow.name == "some name"
      assert workflow.description == "some description"
    end

    test "create_workflow/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Boards.create_workflow(@invalid_attrs)
    end

    test "update_workflow/2 with valid data updates the workflow" do
      workflow = workflow_fixture()
      update_attrs = %{name: "some updated name", description: "some updated description"}

      assert {:ok, %Workflow{} = workflow} = Boards.update_workflow(workflow, update_attrs)
      assert workflow.name == "some updated name"
      assert workflow.description == "some updated description"
    end

    test "update_workflow/2 with invalid data returns error changeset" do
      workflow = workflow_fixture()
      assert {:error, %Ecto.Changeset{}} = Boards.update_workflow(workflow, @invalid_attrs)
      assert workflow == Boards.get_workflow!(workflow.id)
    end

    test "delete_workflow/1 deletes the workflow" do
      workflow = workflow_fixture()
      assert {:ok, %Workflow{}} = Boards.delete_workflow(workflow)
      assert_raise Ecto.NoResultsError, fn -> Boards.get_workflow!(workflow.id) end
    end

    test "change_workflow/1 returns a workflow changeset" do
      workflow = workflow_fixture()
      assert %Ecto.Changeset{} = Boards.change_workflow(workflow)
    end
  end

  describe "stages" do
    alias KanbanLive.Boards.Stage

    import KanbanLive.BoardsFixtures

    @invalid_attrs %{name: nil, position: nil}

    test "list_stages/0 returns all stages" do
      stage = stage_fixture()
      assert Boards.list_stages() == [stage]
    end

    test "get_stage!/1 returns the stage with given id" do
      stage = stage_fixture()
      assert Boards.get_stage!(stage.id) == stage
    end

    test "create_stage/1 with valid data creates a stage" do
      valid_attrs = %{name: "some name", position: 42}

      assert {:ok, %Stage{} = stage} = Boards.create_stage(valid_attrs)
      assert stage.name == "some name"
      assert stage.position == 42
    end

    test "create_stage/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Boards.create_stage(@invalid_attrs)
    end

    test "update_stage/2 with valid data updates the stage" do
      stage = stage_fixture()
      update_attrs = %{name: "some updated name", position: 43}

      assert {:ok, %Stage{} = stage} = Boards.update_stage(stage, update_attrs)
      assert stage.name == "some updated name"
      assert stage.position == 43
    end

    test "update_stage/2 with invalid data returns error changeset" do
      stage = stage_fixture()
      assert {:error, %Ecto.Changeset{}} = Boards.update_stage(stage, @invalid_attrs)
      assert stage == Boards.get_stage!(stage.id)
    end

    test "delete_stage/1 deletes the stage" do
      stage = stage_fixture()
      assert {:ok, %Stage{}} = Boards.delete_stage(stage)
      assert_raise Ecto.NoResultsError, fn -> Boards.get_stage!(stage.id) end
    end

    test "change_stage/1 returns a stage changeset" do
      stage = stage_fixture()
      assert %Ecto.Changeset{} = Boards.change_stage(stage)
    end
  end

  describe "cards" do
    alias KanbanLive.Boards.Card

    import KanbanLive.BoardsFixtures

    @invalid_attrs %{position: nil, title: nil}

    test "list_cards/0 returns all cards" do
      card = card_fixture()
      assert Boards.list_cards() == [card]
    end

    test "get_card!/1 returns the card with given id" do
      card = card_fixture()
      assert Boards.get_card!(card.id) == card
    end

    test "create_card/1 with valid data creates a card" do
      valid_attrs = %{position: 42, title: "some title"}

      assert {:ok, %Card{} = card} = Boards.create_card(valid_attrs)
      assert card.position == 42
      assert card.title == "some title"
    end

    test "create_card/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Boards.create_card(@invalid_attrs)
    end

    test "update_card/2 with valid data updates the card" do
      card = card_fixture()
      update_attrs = %{position: 43, title: "some updated title"}

      assert {:ok, %Card{} = card} = Boards.update_card(card, update_attrs)
      assert card.position == 43
      assert card.title == "some updated title"
    end

    test "update_card/2 with invalid data returns error changeset" do
      card = card_fixture()
      assert {:error, %Ecto.Changeset{}} = Boards.update_card(card, @invalid_attrs)
      assert card == Boards.get_card!(card.id)
    end

    test "delete_card/1 deletes the card" do
      card = card_fixture()
      assert {:ok, %Card{}} = Boards.delete_card(card)
      assert_raise Ecto.NoResultsError, fn -> Boards.get_card!(card.id) end
    end

    test "change_card/1 returns a card changeset" do
      card = card_fixture()
      assert %Ecto.Changeset{} = Boards.change_card(card)
    end
  end
end
