import Cache
import Server

defmodule CacheTest do
  use ExUnit.Case
  doctest Server

  test "create person on cache" do
    {:ok, cache_id} = Cache.start()
    p1 = server_process cache_id, "p1"
    p2 = server_process cache_id, "p2"

    add_person p1, %{name: "John", age: 24}
    add_person p2, %{name: "Jane", age: 24}
    p1_people_23 = people_by_age p1, 23
    p1_people_24 = people_by_age p1, 24
    p2_people_23 = people_by_age p2, 23
    p2_people_24 = people_by_age p2, 24
    assert p1_people_23 == []
    assert p1_people_24 == [%{age: 24, id: 1, name: "John"}]
    assert p2_people_23 == []
    assert p2_people_24 == [%{age: 24, id: 1, name: "Jane"}]
  end
end
