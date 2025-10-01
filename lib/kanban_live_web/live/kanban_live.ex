defmodule KanbanLiveWeb.BoardLive do
  use KanbanLiveWeb, :live_view

  alias KanbanLive.Repo
  alias KanbanLive.Boards.{Workflow, Stage, Card}

  @impl true
  def mount(_params, _session, socket) do
    workflows =
      Workflow
      |> Repo.all()
      |> Repo.preload(stages: [:cards])

    {:ok, assign(socket, workflows: workflows)}
  end

  @impl true
  def handle_event("move_card", %{"card-id" => card_id}, socket) do
    card = Repo.get!(Card, card_id) |> Repo.preload(:stage)
    current_stage = card.stage

    workflow = Repo.get!(Workflow, current_stage.workflow_id) |> Repo.preload(:stages)
    stages = Enum.sort_by(workflow.stages, & &1.position)
    current_idx = Enum.find_index(stages, fn s -> s.id == current_stage.id end)

    if current_idx < length(stages) - 1 do
      new_stage = Enum.at(stages, current_idx + 1)

      card
      |> Ecto.Changeset.change(%{stage_id: new_stage.id})
      |> Repo.update!()
    end

    new_workflows =
      Workflow
      |> Repo.all()
      |> Repo.preload(stages: [:cards])

    {:noreply, assign(socket, :workflows, new_workflows)}
  end

  def render(assigns) do
    ~H"""
    <div class="p-6 bg-gray-100 min-h-screen">
      <h1 class="text-3xl font-bold mb-6 text-black text-center">Sistema Kanban</h1>
    <%= for workflow <- @workflows do %>
        <div class="mb-10 p-6 bg-white rounded-lg shadow-lg border border-gray-200">
          <h2 class="text-2xl font-bold mb-4 text-gray-800 border-b pb-2"><%= workflow.name %></h2>

          <div class="flex space-x-6 overflow-x-auto py-4">
            <%= for stage <- Enum.sort_by(workflow.stages, & &1.position) do %>
              <div class="bg-gray-50 rounded-lg shadow-md w-72 flex-shrink-0">
                <div class={"p-3 rounded-t-lg font-bold text-white text-center shadow-inner #{stage_header_color(stage.name)}"}>
                  <%= stage.name %> (<%= length(stage.cards) %>)
                </div>

                <div class="p-3 space-y-3 min-h-[100px]">
                  <%= for card <- stage.cards do %>
                    <div class="bg-white text-gray-800 p-3 rounded shadow-sm hover:shadow-md transition-shadow border border-gray-200 relative min-h-[60px]">
                      <div class="text-center text-md font-semibold">
                        <%= card.title %>
                      </div>

                      <div class="absolute bottom-2 right-2">
                        <button
                          phx-click="move_card"
                          phx-value-card-id={card.id}
                          class="bg-gray-200 px-2 py-0.5 rounded-full hover:bg-gray-300 text-sm font-bold text-gray-600"
                          aria-label="Mover card"
                        >
                          →
                        </button>
                      </div>
                    </div>
                  <% end %>
                </div>
              </div>
            <% end %>
          </div>
        </div>
      <% end %>
    </div>
    """
  end

  # Funções privadas de ajuda (Helpers)

  # Define cores diferentes para os cabeçalhos das stages
  defp stage_header_color("Candidatura"), do: "bg-blue-500"
  defp stage_header_color("Triagem"), do: "bg-blue-600"
  defp stage_header_color("Entrevista Final"), do: "bg-blue-700"
  defp stage_header_color("Aprovado"), do: "bg-green-500"

  defp stage_header_color("Backlog"), do: "bg-purple-500"
  defp stage_header_color("Análise"), do: "bg-purple-600"
  defp stage_header_color("Desenvolvimento"), do: "bg-purple-700"
  defp stage_header_color("Code Review"), do: "bg-purple-800"
  defp stage_header_color("Deploy"), do: "bg-green-500"

  defp stage_header_color("Solicitação"), do: "bg-yellow-500"
  defp stage_header_color("Em Análise"), do: "bg-yellow-600"
  defp stage_header_color("Aguardando Cliente"), do: "bg-orange-500"
  defp stage_header_color("Resolvido"), do: "bg-green-600"

  # Caso não tenha cor específica, usa cinza
  defp stage_header_color(_), do: "bg-gray-500"
end
