defmodule Concat do
  def join(a, b, sep \\ " ") do
    a <> sep <> b
  end
end

IO.puts Concat.join("a", "b")
IO.puts Concat.join("a", "b", ",")
IO.puts Concat.join("a", "b", "_")
