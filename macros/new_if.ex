defmodule NewIf do
  defmacro if?(condition, do: block, else: other) do
    quote do
      cond do
        unquote(condition) == true -> unquote(block)
        unquote(condition) == false -> unquote(other)
      end
    end
  end
end
