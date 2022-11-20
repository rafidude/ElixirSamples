defmodule MyLib do
  defmacro test(arg) do
    arg   |> IO.inspect
  end

  defmacro if_palindrome?(str, expr) do
    quoted = quote do
      if(unquote(str) == String.reverse( unquote(str) )) do
        unquote(expr)
      end
    end

    # quoted |> Macro.to_string |> IO.inspect
    quoted |> Macro.expand_once(__ENV__) |> IO.inspect
    quoted
  end
end

defmodule Main do
  require MyLib

  def start! do
    # MyLib.test({1, 2, 3})
    # MyLib.test(1 + 2) |> IO.inspect
    MyLib.if_palindrome?("745", IO.puts("yes"))
  end
end

Main.start!
