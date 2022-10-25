defmodule Stats do
  def sum(vals) do
    vals
    |> Enum.reduce(0, &+/2)
  end

  def count(vals) do
    vals
    |> length
  end

  def average(vals) do
    sum(vals) / count(vals)
  end
end
