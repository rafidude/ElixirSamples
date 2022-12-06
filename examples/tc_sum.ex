# Tail call optimized sum function
defmodule TcSum do
  def sum(l), do: sump(l, 0)
  defp sump([], total), do: total
  defp sump([head | tail], total) do
    total = total + head
	  sump(tail, total)
  end
  def len(l), do: lenp(l, 0)
  defp lenp([], total), do: total
  defp lenp([_ | tail], total) do
    total = total + 1
	  lenp(tail, total)
  end
  def rng(l, m), do: rngp(l, m, [])
  defp rngp(l, m, arr) when l > m, do: arr
  defp rngp(l, m, arr) do
    arr = [m | arr]
	  rngp(l, m - 1, arr)
  end
  def pos(l), do: posp(l, [])
  defp posp([], parr), do: Enum.reverse parr
  defp posp([hd | tl], parr) when hd < 0, do: posp(tl, parr)
  defp posp([hd | tl], parr), do: posp(tl, [hd | parr])
end
