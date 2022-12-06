defmodule TodoListTest do
  use ExUnit.Case
  doctest TodoList

  test "create a new todolist" do
    assert TodoList.new() == %TodoList{auto_id: 1, entries: %{}}
  end
end
