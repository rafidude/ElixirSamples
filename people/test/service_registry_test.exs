import People.ServiceRegistry
import People.Server

defmodule ServiceRegistryTest do
  use ExUnit.Case
  doctest People.ServiceRegistry

  test "create person via service registry" do
    # {:ok, sr_id} = People.ServiceRegistry.start()
    Supervisor.start_link([People.ServiceRegistry], strategy: :one_for_one)
    p1 = server_process "p1"
    p2 = server_process "p2"

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
