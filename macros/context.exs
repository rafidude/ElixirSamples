defmodule Mod do
  defmacro definfo do
    IO.puts "definfo :: Macro's context #{__MODULE__}"
    my_var = __MODULE__
    quote do
      IO.puts "definfo :: Caller's context #{__MODULE__}"
      IO.puts "My var: #{unquote(my_var)}"
      def friendly_info do
        IO.puts "friend_info :: Module name #{__MODULE__}"
        IO.puts "My var: #{unquote(my_var)}"
      end
    end
  end
end

defmodule MyModule do
  require Mod
  Mod.definfo
end
