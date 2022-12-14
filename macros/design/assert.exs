defmodule Assertion do
  def print_result(op, lhs, rhs, res) do
    if res do
      IO.puts "#{lhs} > #{rhs} is #{res}"
    else
      IO.puts "FAILURE:"
      IO.puts "  Expected: #{rhs}"
      if op == ">" do
        IO.puts "  to be greater than: #{lhs}"
      else
        IO.puts "  to be equal: #{lhs}"
      end
    end
  end

  # defmacro assert({op, _, [lhs, rhs]}) do
  #   quote bind_quoted: [op: op, lhs: lhs, rhs: rhs] do

  #   end
  # end

  defmacro assert({:>, _, [lhs, rhs]}) do
    quote do
      lhs = unquote(lhs)
      rhs = unquote(rhs)
      res = lhs > rhs
      # IO.puts "#{lhs} > #{rhs} is #{res}"
      print_result(">", lhs, rhs, res)
    end
  end

  defmacro assert({:==, _, [lhs, rhs]}) do
    quote do
      lhs = unquote(lhs)
      rhs = unquote(rhs)
      res = lhs == rhs
      # IO.puts "#{lhs} == #{rhs} is #{res}"
      print_result("==", lhs, rhs, res)
    end
  end
end

defmodule Functionality do
  import Assertion
  def run do
    assert 1 > 2
    assert 2 > 1
    assert 5 == 5
    assert 5 == 8
  end
end

Functionality.run()
