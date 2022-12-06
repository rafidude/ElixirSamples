defmodule TodoServerTest do
  use ExUnit.Case
  doctest TodoServer
  test "create a new TodoServer" do
    TodoServer.start
    TodoServer.add_entry %{date: ~D[2018-12-20], title: "This"}
    TodoServer.add_entry %{date: ~D[2018-12-20], title: "That"}
    assert TodoServer.entries ~D[2018-12-20] == [
        %{date: ~D[2018-12-20], id: 1, title: "This"},
        %{date: ~D[2018-12-20], id: 2, title: "That"}
      ]
  end
end
