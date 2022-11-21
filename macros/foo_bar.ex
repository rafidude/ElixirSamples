defmodule Foo do
  defmacro foo do
    IO.puts("macro")

    quote do
      IO.puts("caller")
    end
  end
end

defmodule Bar do
  require Foo

  def execute do
    IO.puts("execute")
    Foo.foo
  end
end
