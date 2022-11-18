defmodule ListUtils do
  def max([v | [h | t]]) when v < h do
    max([h | t])
  end

  def max([v | [h | t]]) when v >= h do
    max([v | t])
  end

  def max([v]), do: v

  def map([], _fun), do: []
  def map([h | t], fun) do
    [fun.(h) | map(t, fun)]
  end

  def sum([]), do: 0
  def sum([head | tail]), do: head + sum(tail)

  def multi([]), do: 1
  def multi([head | tail]), do: head * multi(tail)

  def fact(0), do: 1
  def fact(n) when n > 0, do: n * fact(n - 1)

  def comp(0, _per), do: 1.0
  def comp(terms, per), do: (1 + per) * comp(terms - 1, per)
end

IO.puts ListUtils.sum([1, 2, 3, 4, 5])
IO.puts ListUtils.multi([1, 2, 3, 4, 5])
# IO.puts ListUtils.comp(10*50, 0.01)
# IO.puts ListUtils.fact(10)
ListUtils.map([1, 2, 3, 4, 5], fn(x) -> x * 2 end) |> IO.inspect
ListUtils.max([3, 1, 50, 24]) |> IO.inspect

ListUtils.map([3, 4, 5, 4, 3, 2, 1, 1],
  fn(x) -> ListUtils.comp(50, x/100.0) end)
  |> IO.inspect()
  |> ListUtils.multi()
  |> IO.inspect()
