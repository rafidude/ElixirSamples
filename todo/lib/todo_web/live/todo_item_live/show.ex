defmodule TodoWeb.TodoItemLive.Show do
  use TodoWeb, :live_view

  alias Todo.Items

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:todo_item, Items.get_todo_item!(id))}
  end

  defp page_title(:show), do: "Show Todo item"
  defp page_title(:edit), do: "Edit Todo item"
end
