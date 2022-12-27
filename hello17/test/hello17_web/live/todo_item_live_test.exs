defmodule Hello17Web.TodoItemLiveTest do
  use Hello17Web.ConnCase

  import Phoenix.LiveViewTest
  import Hello17.ItemsFixtures

  @create_attrs %{text: "some text"}
  @update_attrs %{text: "some updated text"}
  @invalid_attrs %{text: nil}

  defp create_todo_item(_) do
    todo_item = todo_item_fixture()
    %{todo_item: todo_item}
  end

  describe "Index" do
    setup [:create_todo_item]

    test "lists all todo_items", %{conn: conn, todo_item: todo_item} do
      {:ok, _index_live, html} = live(conn, ~p"/todo_items")

      assert html =~ "Listing Todo items"
      assert html =~ todo_item.text
    end

    test "saves new todo_item", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, ~p"/todo_items")

      assert index_live |> element("a", "New Todo item") |> render_click() =~
               "New Todo item"

      assert_patch(index_live, ~p"/todo_items/new")

      assert index_live
             |> form("#todo_item-form", todo_item: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#todo_item-form", todo_item: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, ~p"/todo_items")

      assert html =~ "Todo item created successfully"
      assert html =~ "some text"
    end

    test "updates todo_item in listing", %{conn: conn, todo_item: todo_item} do
      {:ok, index_live, _html} = live(conn, ~p"/todo_items")

      assert index_live |> element("#todo_items-#{todo_item.id} a", "Edit") |> render_click() =~
               "Edit Todo item"

      assert_patch(index_live, ~p"/todo_items/#{todo_item}/edit")

      assert index_live
             |> form("#todo_item-form", todo_item: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#todo_item-form", todo_item: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, ~p"/todo_items")

      assert html =~ "Todo item updated successfully"
      assert html =~ "some updated text"
    end

    test "deletes todo_item in listing", %{conn: conn, todo_item: todo_item} do
      {:ok, index_live, _html} = live(conn, ~p"/todo_items")

      assert index_live |> element("#todo_items-#{todo_item.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#todo_item-#{todo_item.id}")
    end
  end

  describe "Show" do
    setup [:create_todo_item]

    test "displays todo_item", %{conn: conn, todo_item: todo_item} do
      {:ok, _show_live, html} = live(conn, ~p"/todo_items/#{todo_item}")

      assert html =~ "Show Todo item"
      assert html =~ todo_item.text
    end

    test "updates todo_item within modal", %{conn: conn, todo_item: todo_item} do
      {:ok, show_live, _html} = live(conn, ~p"/todo_items/#{todo_item}")

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Todo item"

      assert_patch(show_live, ~p"/todo_items/#{todo_item}/show/edit")

      assert show_live
             |> form("#todo_item-form", todo_item: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        show_live
        |> form("#todo_item-form", todo_item: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, ~p"/todo_items/#{todo_item}")

      assert html =~ "Todo item updated successfully"
      assert html =~ "some updated text"
    end
  end
end
