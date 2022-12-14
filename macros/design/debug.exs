defmodule Debugger do
  defmacro log_bad(expression) do
    if Application.get_env(:debugger, :log_level) == :debug do
      quote do
        IO.puts "================="
        IO.inspect unquote(expression)
        IO.puts "================="
        unquote(expression)
      end
    else
      expression
    end
  end

  defmacro log(expression) do
    if Application.get_env(:debugger, :log_level) == :debug do
      quote bind_quoted: [expression: expression] do
        IO.puts "================="
        IO.inspect expression
        IO.puts "================="
        expression
      end
    else
      expression
    end
  end
end

defmodule Functionality do
  require Debugger
  def run do
    Application.put_env(:debugger, :log_level, :debug)
    remote_api_call = fn -> IO.puts("calling remote API...") end
    Debugger.log_bad(remote_api_call.())
    # Debugger.log(remote_api_call.())
  end
end

Functionality.run()
