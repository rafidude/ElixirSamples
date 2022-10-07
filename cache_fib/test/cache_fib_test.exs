defmodule CacheFibTest do
  use ExUnit.Case
  doctest CacheFib

  test "greets the world" do
    assert CacheFib.hello() == :world
  end
end
