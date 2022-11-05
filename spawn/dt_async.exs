defmodule DTAsync do
  def slowf id do
    Process.sleep 1000 + :rand.uniform 1000
    "res: #{id}"
  end

  def asyncf id do
    who = self()
    spawn(fn -> send who, {:res, slowf(id)} end)
  end

  def getres do
    receive do
      {:res, res} ->
        IO.puts res
        res
    end
  end

  def getqueryres do
    Enum.map(1..5, &asyncf("query #{&1}"))
    IO.inspect Enum.map(1..5, fn _ -> getres() end)
  end
end

DTAsync.getqueryres()
