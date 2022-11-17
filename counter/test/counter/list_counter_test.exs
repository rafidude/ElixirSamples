defmodule Counter.ListCounterTest do
  use ExUnit.Case, async: true
  alias Counter.ListCounter

  test "setup increment and decrement functionality" do
    assert ListCounter.value() == %{"a" => 10, "b" => 20}

    ListCounter.increment("a")
    assert ListCounter.value() == %{"a" => 11, "b" => 20}
    ListCounter.decrement("b")
    assert ListCounter.value() == %{"a" => 11, "b" => 19}
  end
end
