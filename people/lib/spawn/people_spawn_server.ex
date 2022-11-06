defmodule PeopleSpawnServer do
  def start do
    spawn(fn ->
      Process.register(self(), :people_server)
      loop(People.new())
    end)
  end

  def add_person(new_person) do
    send(:people_server, {:add_person, new_person})
  end

  def list_people_by(age) do
    send(:people_server, {:entries, self(), age})

    receive do
      {:data, entries} -> entries
    after
      5000 -> {:error, :timeout}
    end
  end

  defp loop(people) do
    new_people =
      receive do
        message -> process_message(people, message)
      end

    loop(new_people)
  end

  defp process_message(people, {:add_person, new_person}) do
    People.create(people, new_person)
  end

  defp process_message(people, {:entries, caller, age}) do
    send(caller, {:data, People.read(people, age)})
    people
  end

  defp process_message(people, _), do: people
end
