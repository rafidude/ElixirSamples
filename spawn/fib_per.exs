defmodule FibPercent do
  def run do
    fib = [1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144]
    IO.inspect fib
    res = next_two(fib, [])
    IO.inspect res
  end

  def next_two([n1, n2 | tl], res) do
    res = [perc(n1, n2) | res]
    IO.puts "#{n1}, #{n2}, #{IO.inspect res}"
    if length(tl > 0) do
      tl = [n2 | tl]
      next_two(tl, res)
    else
      res
    end
  end

  def perc(n1, n2) do
    (n2 - n1) * 100.0 / n1
  end
end

FibPercent.run()
