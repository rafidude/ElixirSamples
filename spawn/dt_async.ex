defmodule DTAsync do
  def slowf id do
    Process.sleep 2000
    "res: #{id}"
  end

  def asyncf id do
    who = self()
    spawn(fn -> send who, {:res, slowf(id)} end)
  end

  def getres do
    receive do
      {:res, res} ->
        res
    end
  end

  def getqueryres do
    Enum.map(1..5, &asyncf("query #{&1}"))
    Enum.map(1..5, fn _ -> getres() end)
  end
end
