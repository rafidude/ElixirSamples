defmodule HelloTest do
  use ExUnit.Case
  doctest Hello

  test "greets the world" do
    assert Hello.hello() == :World
  end
end
