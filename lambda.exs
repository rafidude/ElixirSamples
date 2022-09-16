salt = "123"
# mad_printer = fn(a_str) ->
mad_printer = fn
  ("") -> IO.puts("Empty string")
  (a_str) ->
    salt <> a_str |>
    String.reverse |>
    IO.puts
  end

Enum.each ["Hello", "there", "", "friend"], mad_printer
