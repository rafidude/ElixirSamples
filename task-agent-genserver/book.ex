defmodule Book do
  @moduledoc """
  iex(1)> Book.start
  {:ok, #PID<0.114.0>}
  iex(2)> Book.put("A", ["B1", "B2"])
  :ok
  iex(3)> Book.get("A")
  ["B1", "B2"]
  """

  def start do
    Agent.start(fn -> %{} end, name: __MODULE__)
  end

  def get(author) do
    Agent.get(__MODULE__, fn state -> state[author] end)
  end

  def put(author, books) do
    Agent.update(__MODULE__, fn state ->
      Map.put(state, author, books)
    end)
  end
end
