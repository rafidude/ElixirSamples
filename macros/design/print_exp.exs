defmodule PrintExpression do
  defmacro say({:+, _, [lhs, rhs]}) do
    quote do
      lhs = unquote(lhs)
      rhs = unquote(rhs)
      sum = lhs + rhs
      IO.puts "#{lhs} + #{rhs} = #{sum}"
    end
  end

  defmacro say({:*, _, [lhs, rhs]}) do
    quote do
      lhs = unquote(lhs)
      rhs = unquote(rhs)
      sum = lhs * rhs
      IO.puts "#{lhs} * #{rhs} = #{sum}"
    end
  end
end

defmodule Functionality do
  import PrintExpression
  def run do
    say 1 + 2
    say 5 * 8
  end
end

Functionality.run()
