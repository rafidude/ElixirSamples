defmodule Sp1 do
  def greet do
    receive do
      {sender, msg} ->
        IO.inspect self()
        IO.puts "Received message #{msg}"
        send sender, { :ok, "Hello, #{msg}" }
    end
    greet()
  end
end

# here's a client
pid = spawn(Sp1, :greet, [])
msg1 = "World!"
IO.puts "Sending message1 #{msg1}"
send pid, {self(), msg1}
receive do
  {:ok, message} ->
    IO.inspect self()
    IO.puts "Final message1: #{message}"
end

msg2 = "Kermit!"
IO.puts "Sending message2 #{msg2}"
send pid, {self(), msg2}
receive do
  {:ok, message} ->
    IO.inspect self()
    IO.puts "Final message2: #{message}"
  after 500 ->
    IO.puts "The greeter has gone away"
end
