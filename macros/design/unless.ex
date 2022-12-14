defmodule LangExt do
  defmacro unless(expr, do: block) do
    quote do
      if !unquote(expr), do: unquote(block)
    end
  end
end

defmodule Functionality do
  require LangExt
  def run do
    LangExt.unless 1 > 2, do: "Yes 1 is not greater than 2"
  end
end

"""
> iex unless.ex
iex(4)> import Functionality
iex(5)> run
"Yes 1 is not greater than 2"
"""
