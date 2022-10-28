defmodule Calculator.StackServer do
  use GenServer
  alias Calculator.StackCore

  def start_link(initial) when is_list(initial) do
    GenServer.start_link(__MODULE__, initial)
  end

  def init(stack) do
    {:ok, stack}
  end

  def handle_cast({:push, element}, state) do
    {:noreply, StackCore.push(state, element)}
  end

  def handle_call(:pop, _from, state) do
    {element, state} = StackCore.pop(state)
    {:reply, element, state}
  end

  def handle_call(:state, _from, state) do
    {:reply, state, state}
  end

  def push(pid, element), do: GenServer.cast(pid, {:push, element})

  def pop(pid) do
    GenServer.call(pid, :pop)
  end

  def state(pid) do
    GenServer.call(pid, :state)
  end

end
