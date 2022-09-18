defmodule Point do
  def right({x, y}), do: {x+1, y}
  def left({x, y}), do: {x-1, y}
  def up({x, y}), do: {x, y-1}
  def down({x, y}), do: {x, y+1}
end
