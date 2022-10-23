defmodule PlugHttpTest do
  use ExUnit.Case
  doctest PlugHttp

  test "greets the world" do
    assert PlugHttp.hello() == :world
  end
end
