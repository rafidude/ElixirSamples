# String.Chars Protocol for Elixir PIDs
# https://devbrett.com/2018/08/implement-string-protocol-elixir-pid.html

defimpl String.Chars, for: PID do
  def to_string(pid) do
    # info = Process.info pid
    # name = info[:registered_name]

    # "#{name}-#{inspect pid}"
    "#{inspect pid}"
  end
end

defmodule Sp1 do
  def greet do
    receive do
      {sender, msg} ->
        IO.puts "#{self()}: Received message #{msg}"
        send sender, { :ok, "Hello, #{msg}" }
    end
    greet()
  end
end

# here's a client
pid = spawn(Sp1, :greet, [])
msg1 = "World!"
IO.puts "#{self()}: Sending message1 #{msg1}"
send pid, {self(), msg1}
receive do
  {:ok, message} ->
    IO.puts "Final message1: #{message}"
end

msg2 = "Kermit!"
IO.puts "#{self()}: Sending message2 #{msg2}"
send pid, {self(), msg2}
receive do
  {:ok, message} ->
    IO.puts "Final message2: #{message}"
  after 500 ->
    IO.puts "The greeter has gone away"
end
