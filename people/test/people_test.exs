import People
defmodule PeopleTest do
  use ExUnit.Case
  doctest People

  test "create person data" do
    p = new()
    p = create(p, %{name: "John", age: 24})
    assert read(p, 25) == []
    assert read(p, 24) == [%{age: 24, id: 1, name: "John"}]
  end

  test "create people data" do
    p = new()
    p = create(p, %{name: "John", age: 24})
    p = create(p, %{name: "Jane", age: 23})
    p = create(p, %{name: "Mary", age: 23})
    people_23 = read(p, 23)
    assert people_23 ==  [%{age: 23, id: 2, name: "Jane"}, %{age: 23, id: 3, name: "Mary"}]
    assert length(people_23) == 2
  end
end
