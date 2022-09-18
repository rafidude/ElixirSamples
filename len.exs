defmodule Utils do
  def len([]) do
    0
  end
  def len([_ | t]) do
    1 + len(t)
  end

  def word_count([], kwl), do: kwl

  def word_count([h | t], kwl) do
    kwl.h = kwl.h + 1
    word_count(t, kwl)
  end
end

IO.inspect Utils.len([2, 3])
IO.inspect(Utils.word_count([:one, :two, :two]))
