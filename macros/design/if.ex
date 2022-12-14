defmodule LangExt do
  defmacro mif(expr, do: if_block), do: if(expr, do: if_block, else: nil)
  defmacro mif(expr, do: if_block, else: else_block) do
    quote do
      case unquote(expr) do
        result when result in [false, nil] -> unquote(else_block)
        _ -> unquote(if_block)
      end
    end
  end
end

defmodule Functionality do
  require LangExt
  def run do
    LangExt.mif 2 > 1, do: "Yes 2 is greater than 1"
    LangExt.mif 1 > 2, do: "False statement 1 > 2", else: "Nope 1 is less than 2"
  end
end

"""
> iex if.ex
iex(4)> import Functionality
iex(5)> run
"Yes 2 is greater than 1"
"""

"""
Problem: Only one of the two statements in run works
"""
