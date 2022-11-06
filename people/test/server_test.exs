import Server
defmodule ServerTest do
  use ExUnit.Case
  doctest Server

  test "create person on server" do
    {:ok, pid} = start()
    add_person pid, %{name: "John", age: 24}
    people_23 = people_by_age pid, 23
    people_24 = people_by_age pid, 24
    assert people_23 == []
    assert people_24 == [%{age: 24, id: 1, name: "John"}]
  end

  test "create people on server" do
    {:ok, pid} = start()
    add_person pid, %{name: "John", age: 24}
    add_person pid, %{name: "Jane", age: 23}
    add_person pid, %{name: "Mary", age: 23}

    people_23 = people_by_age pid, 23
    people_24 = people_by_age pid, 24
    assert length(people_23) == 2
    assert people_23 == [%{age: 23, id: 2, name: "Jane"}, %{age: 23, id: 3, name: "Mary"}]
    assert people_24 == [%{age: 24, id: 1, name: "John"}]
  end
end
