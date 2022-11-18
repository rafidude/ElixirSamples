defmodule LL do
  def mapsum([], i, _f), do: i
  def mapsum([h|t], i, f), do: mapsum(t, f.(h) + i, f)
end
