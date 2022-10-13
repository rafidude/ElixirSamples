defmodule LTodos.TodosFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `LTodos.Todos` context.
  """

  @doc """
  Generate a todo.
  """
  def todo_fixture(attrs \\ %{}) do
    {:ok, todo} =
      attrs
      |> Enum.into(%{
        done: true,
        title: "some title"
      })
      |> LTodos.Todos.create_todo()

    todo
  end
end
