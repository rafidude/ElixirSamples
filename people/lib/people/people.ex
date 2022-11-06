defmodule People do
  defstruct auto_id: 1, data: %{}

  def new() do
    %People{}
  end

  def create(people, person) do
    person = Map.put(person, :id, people.auto_id)
    new_data = Map.put(people.data, people.auto_id, person)
    %People{people | auto_id: people.auto_id + 1, data: new_data }
  end

  def read(people, age) do
    people.data
    |> Enum.filter(fn {_, v} -> v.age == age end)
    |> Enum.map(fn {_, v} -> v end)
  end

  def update(people, %{} = person) do
    update(people, person.id, person)
  end

  def update(people, id, person) do
    case Map.fetch(people.data, id) do
      :error ->
        people
      {:ok, _} ->
        new_data = Map.put(people.data, person.id, person)
        %People{people | data: new_data }
    end
  end

  def delete(people, id) do
    %People{ people | data: Map.delete(people.data, id)}
  end

end
