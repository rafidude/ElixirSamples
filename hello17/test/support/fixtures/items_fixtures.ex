defmodule Hello17.ItemsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Hello17.Items` context.
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
      |> Hello17.Items.create_todo_item()

    todo_item
  end
end
