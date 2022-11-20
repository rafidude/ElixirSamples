defmodule MyMacro do
  defmacro gen_funcs(kv) do
    for {key, value} <- kv do
      quote do
        def unquote(key)(), do: unquote(value)
      end
    end
  end
end

defmodule MyModule do
  require MyMacro

  MyMacro.gen_funcs([one: 1, two: 2, three: 3])
end
