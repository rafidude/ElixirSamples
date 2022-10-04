defmodule CounterTest do
  use ExUnit.Case
  doctest Counter

  test "inc increments an integer value" do
    assert Counter.Core.inc(1) == 2
  end

  test "use Counter through API" do
    pid = Counter.start(0)
    assert Counter.state(pid) == 0

    Counter.tick(pid)
    Counter.tick(pid)
    Counter.tick(pid)
    assert Counter.state(pid) == 3
  end
end
