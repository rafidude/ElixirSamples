defmodule Loop do

  defmacro while(expression, do: block) do
    quote do
      try do
        for _ <- Stream.cycle([:ok]) do
          if unquote(expression) do
            unquote(block)
          else
            Loop.break
          end
        end
      catch
        :break -> :ok
      end
    end
  end

  def break, do: throw :break
end

defmodule Functionality do
  import Loop
  def run_loop do
    pid = spawn(fn -> :timer.sleep(4000) end)
    while Process.alive?(pid) do
      IO.inspect :erlang.time
      :timer.sleep 1000
    end
  end

  def receive_msgs do
    while true do
      receive do
        :stop ->
          IO.puts "Stopping..."
          break()
        msg ->
          IO.puts "Received #{IO.inspect(msg)}"
      end
    end
  end
end

# Functionality.run_loop()
# FixIt
# pid = spawn Functionality.receive_msgs()
# send pid, :hello
