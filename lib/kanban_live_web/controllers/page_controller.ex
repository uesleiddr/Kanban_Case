defmodule KanbanLiveWeb.PageController do
  use KanbanLiveWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end
end
