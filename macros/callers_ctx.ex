defmodule Mod do
  defmacro myinfo do
    IO.puts "In macro's context (#{__MODULE__})."

    quote do
      IO.puts "In caller's context (#{__MODULE__})."

      def friendly_info do
        IO.puts """
        My name is #{__MODULE__}
        My functions are #{inspect __info__(:functions)}
        """
      end
    end
  end
end

defmodule MyModule do
  require Mod
  Mod.myinfo()
end
