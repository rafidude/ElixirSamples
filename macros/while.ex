defmodule While do
  defmacro while(expression, do: block) do
    quote do
      # IO.puts "Got expression & block"
      # IO.inspect unquote(expression)
      # IO.inspect unquote(block)
      IO.puts "Got: #{unquote(inspect expression)}\n#{unquote(inspect block)}"
    end
  end
end
