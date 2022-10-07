defmodule TextClientTest do
  use ExUnit.Case
  doctest TextClient

  test "start the client" do
    assert TextClient.start() == :ok
  end
end
