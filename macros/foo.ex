defmodule Foo do
  defmacro macro_inspect(value) do
    IO.inspect(value)
    value
  end

  def func_inspect(value) do
    IO.inspect(value)
    value
  end

  defmacro foo(exp) do
    quote do
      doubled = unquote(exp) * 2
      doubled
    end
  end
end
