defmodule Tensorp.Server do
  use GenServer

  #client side api
  def start_link(initial_state \\ []) do
    GenServer.start_link(__MODULE__, initial_state, name: :tensorp)
  end

  def show_messages do
    GenServer.call(:tensorp, :get)
  end

  def add_message(msg) do
    GenServer.cast(:tensorp, {:add, msg})
  end

  #server side callbacks
  def init(_) do
    {:ok, []}
  end

  def handle_call(:get, _from, state) do
    {:reply, state, state}
  end

  def handle_cast({:add, msg}, state) do
    {:noreply, [msg | state]}
  end
end
