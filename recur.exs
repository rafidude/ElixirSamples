# Due to immutability, recursion is a big part of elixir
defmodule Recursion1 do
  def sum_list([head | tail], acc) do
    sum_list(tail, acc + head)
  end

  def sum_list([], acc) do
    acc
  end
end

defmodule Recursion2 do
  def sum_list(acc, [head | tail]) do
    sum_list(acc + head, tail)
  end

  def sum_list(acc, []) do
    acc
  end
end

IO.inspect Recursion1.sum_list([1,2,3], 0) #=> 6
IO.inspect Recursion2.sum_list(0, [1,2,3]) #=> 6
