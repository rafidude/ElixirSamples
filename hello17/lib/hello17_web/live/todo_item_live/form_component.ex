defmodule Hello17Web.TodoItemLive.FormComponent do
  use Hello17Web, :live_component

  alias Hello17.Items

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <.header>
        <%= @title %>
        <:subtitle>Use this form to manage todo_item records in your database.</:subtitle>
      </.header>

      <.simple_form
        :let={f}
        for={@changeset}
        id="todo_item-form"
        phx-target={@myself}
        phx-change="validate"
        phx-submit="save"
      >
        <.input field={{f, :text}} type="text" label="text" />
        <:actions>
          <.button phx-disable-with="Saving...">Save Todo item</.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  @impl true
  def update(%{todo_item: todo_item} = assigns, socket) do
    changeset = Items.change_todo_item(todo_item)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"todo_item" => todo_item_params}, socket) do
    changeset =
      socket.assigns.todo_item
      |> Items.change_todo_item(todo_item_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"todo_item" => todo_item_params}, socket) do
    save_todo_item(socket, socket.assigns.action, todo_item_params)
  end

  defp save_todo_item(socket, :edit, todo_item_params) do
    case Items.update_todo_item(socket.assigns.todo_item, todo_item_params) do
      {:ok, _todo_item} ->
        {:noreply,
         socket
         |> put_flash(:info, "Todo item updated successfully")
         |> push_navigate(to: socket.assigns.navigate)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_todo_item(socket, :new, todo_item_params) do
    case Items.create_todo_item(todo_item_params) do
      {:ok, _todo_item} ->
        {:noreply,
         socket
         |> put_flash(:info, "Todo item created successfully")
         |> push_navigate(to: socket.assigns.navigate)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
