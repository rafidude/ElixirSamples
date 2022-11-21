defmodule My do
  defmacro odd(num, do: do_block, else: else_block) do
  	quote do
      if rem(unquote(num), 2) == 1 do
        unquote(do_block)
      else
        unquote(else_block)
      end
    end
  end
end

# require My
# My.odd 3, do: "odd", else: "not"
