defmodule Counter.ListCounter do
  use Agent

  def start_link(_) do
    Agent.start_link(fn -> %{"a" => 10, "b" => 20} end, name: __MODULE__)
  end

  def increment(key) do
    val = get(key) + 1
    put(key, val)
  end

  def decrement(key) do
    val = get(key) - 1
    put(key, val)
  end

  def get(key) do
    Agent.get(__MODULE__, &Map.get(&1, key))
  end

  def put(key, val) do
    Agent.update(__MODULE__, &Map.put(&1, key, val))
  end

  def value() do
    Agent.get(__MODULE__, fn m -> m end)
  end
end
