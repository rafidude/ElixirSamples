# For a list as input, take tail, sum it and then square it

defmodule PipeTest do
  def square(x), do: x * x

  def sum(l, start \\ 0) do
    start + Enum.sum(l)
  end

  def sum_tail_square(l) do
    l
      |> tl
      |> sum(2)
      |> square
  end
end

IO.inspect(PipeTest.sum_tail_square([1, 2, 5]))
