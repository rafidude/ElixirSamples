defmodule Math do
  def add(a, b) do
    a + b
  end

  def div(_, 0) do
    {:error, "Cannot divide by 0"}
  end

  def div(a, b) do
    a / b
  end

  def zero?(0), do: true
  def zero?(x) when is_integer(x), do: false
  def zero?(_), do: "Not a number"

end

IO.puts Math.add(1, 2)
IO.inspect Math.div(1, 2)
IO.inspect Math.div(1, 0)
IO.inspect Math.zero?(0)
IO.inspect Math.zero?(1)
IO.inspect Math.zero?("1")
