defmodule Todo.ItemsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Todo.Items` context.
  """

  @doc """
  Generate a todo_item.
  """
  def todo_item_fixture(attrs \\ %{}) do
    {:ok, todo_item} =
      attrs
      |> Enum.into(%{
        text: "some text"
      })
      |> Todo.Items.create_todo_item()

    todo_item
  end
end
