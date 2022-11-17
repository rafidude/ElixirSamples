defmodule Counter.CounterTest do
  use ExUnit.Case, async: true
  alias Counter.Counter

  test "setup increment and decrement functionality" do
    assert Counter.value() == 0

    Counter.increment()
    assert Counter.value() == 1
    Counter.decrement()
    assert Counter.value() == 0
  end
end
