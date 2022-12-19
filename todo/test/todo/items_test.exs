defmodule Todo.ItemsTest do
  use Todo.DataCase

  alias Todo.Items

  describe "todo_items" do
    alias Todo.Items.TodoItem

    import Todo.ItemsFixtures

    @invalid_attrs %{text: nil}

    test "list_todo_items/0 returns all todo_items" do
      todo_item = todo_item_fixture()
      assert Items.list_todo_items() == [todo_item]
    end

    test "get_todo_item!/1 returns the todo_item with given id" do
      todo_item = todo_item_fixture()
      assert Items.get_todo_item!(todo_item.id) == todo_item
    end

    test "create_todo_item/1 with valid data creates a todo_item" do
      valid_attrs = %{text: "some text"}

      assert {:ok, %TodoItem{} = todo_item} = Items.create_todo_item(valid_attrs)
      assert todo_item.text == "some text"
    end

    test "create_todo_item/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Items.create_todo_item(@invalid_attrs)
    end

    test "update_todo_item/2 with valid data updates the todo_item" do
      todo_item = todo_item_fixture()
      update_attrs = %{text: "some updated text"}

      assert {:ok, %TodoItem{} = todo_item} = Items.update_todo_item(todo_item, update_attrs)
      assert todo_item.text == "some updated text"
    end

    test "update_todo_item/2 with invalid data returns error changeset" do
      todo_item = todo_item_fixture()
      assert {:error, %Ecto.Changeset{}} = Items.update_todo_item(todo_item, @invalid_attrs)
      assert todo_item == Items.get_todo_item!(todo_item.id)
    end

    test "delete_todo_item/1 deletes the todo_item" do
      todo_item = todo_item_fixture()
      assert {:ok, %TodoItem{}} = Items.delete_todo_item(todo_item)
      assert_raise Ecto.NoResultsError, fn -> Items.get_todo_item!(todo_item.id) end
    end

    test "change_todo_item/1 returns a todo_item changeset" do
      todo_item = todo_item_fixture()
      assert %Ecto.Changeset{} = Items.change_todo_item(todo_item)
    end
  end
end
