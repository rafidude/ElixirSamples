defmodule SumProd do
  def sum([]), do: 0
  def sum([h | t]), do: h + sum(t)

  # Buggy version where prod of empty list is 1
  def prod([]), do: 1
  def prod([h | t]), do: h * prod(t)
end
