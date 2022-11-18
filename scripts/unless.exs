defmodule ControlFlow do
  defmacro unless(expression, do: block) do
    quote do
      if !unquote(expression), do: unquote(block)
    end
  end
end

defmodule Plus do
	# {:+, [context: Elixir, import: Kernel], [5, 2]}
	defmacro say({:+, _, [lhs, rhs]}) do
		quote do
			lhs = unquote(lhs)
			rhs = unquote(rhs)
			result = lhs + rhs
			IO.puts "#{lhs} plus #{rhs} is #{result}"
      result
		end
	end
end
