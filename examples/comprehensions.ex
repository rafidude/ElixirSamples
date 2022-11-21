defmodule Comp do
  require Integer

  def double_evens(coll) do
    for el <- coll, Integer.is_even(el), el < 10, do: el * 2
  end

  def multi_coll(c1, c2) do
    for e1 <- c1, e2 <- c2, Integer.is_even(e1), Integer.is_odd(e2),
      do: IO.puts "#{e1}, #{e2}"
  end

  def sqrt_map(c) do
    for e <- c, into: %{}, do: {e, :math.sqrt(e)}
  end
end
