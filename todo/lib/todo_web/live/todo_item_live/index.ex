defmodule TodoWeb.TodoItemLive.Index do
  use TodoWeb, :live_view

  alias Todo.Items
  alias Todo.Items.TodoItem

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :todo_items, list_todo_items())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Todo item")
    |> assign(:todo_item, Items.get_todo_item!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Todo item")
    |> assign(:todo_item, %TodoItem{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Todo items")
    |> assign(:todo_item, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    todo_item = Items.get_todo_item!(id)
    {:ok, _} = Items.delete_todo_item(todo_item)

    {:noreply, assign(socket, :todo_items, list_todo_items())}
  end

  defp list_todo_items do
    Items.list_todo_items()
  end
end
