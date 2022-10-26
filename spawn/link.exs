# spawn only: Nothing happened as far as I am concerned
# spawn_link only: ** (EXIT from #PID<0.95.0>) :boom
# process_flag: MESSAGE RECEIVED: {:EXIT, #PID<0.102.0>, :boom}
defmodule Link3 do
  import :timer, only: [ sleep: 1 ]

  def sad_function do
    sleep 500
    exit(:boom)
  end
  def run do
    Process.flag(:trap_exit, true)
    # spawn(Link3, :sad_function, [])
    spawn_link(Link3, :sad_function, [])
    receive do
      msg ->
        IO.puts "MESSAGE RECEIVED: #{inspect msg}"
    after 1000 ->
        IO.puts "Nothing happened as far as I am concerned"
    end
  end
end

Link3.run
