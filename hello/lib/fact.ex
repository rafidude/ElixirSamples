defmodule Fact do
  def fact(n) when n <= 1, do: 1

  def fact(n) do
    n * fact(n - 1)
  end

  # tail recursive version
  def fact_tr(n) do
    fact_tr(1, n, 1)
  end

  defp fact_tr(_count, 1, result) do
    result
  end

  defp fact_tr(count, n, result) when n >= 1 do
    fact_tr(count + 1, n - 1, result * (count + 1))
  end
end
