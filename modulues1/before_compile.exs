defmodule A do
  defmacro __before_compile__(_env) do
    IO.puts "=============="
    IO.puts "Before Compile"
    dcode = quote do
      IO.puts "Inside quote"
      def hello, do: IO.puts "world"
    end
    IO.puts "After quote"
    dcode
  end

  def __after_compile__(env, _bytecode) do
    IO.puts "=============="
    IO.puts "After Compile"
    IO.inspect(env.file)
  end
end

defmodule B do
  @before_compile A
  @after_compile A
end

B.hello()
B.hello()
#=> "world"
