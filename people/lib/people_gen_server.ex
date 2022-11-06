defmodule PeopleGenServer do
  use GenServer

  def start do
    GenServer.start(PeopleGenServer, nil)
  end

  def add_person(people_server, person) do
    GenServer.cast(people_server, {:add_person, person})
  end

  def entries(people_server, date) do
    GenServer.call(people_server, {:entries, date})
  end

  @impl GenServer
  def init(_) do
    {:ok, People.new()}
  end

  @impl GenServer
  def handle_cast({:add_person, person}, people) do
    new_state = People.create(people, person)
    {:noreply, new_state}
  end

  @impl GenServer
  def handle_call({:entries, date}, _, people) do
    {
      :reply,
      People.read(people, date),
      people
    }
  end
end
