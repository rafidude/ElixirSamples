defmodule Calc do
  def factorial(0), do: 1
  def factorial(n) when n > 0, do: n * factorial(n - 1)
  def factorial(_) do
    {:error, "n must be a non-negative integer"}
  end
end
