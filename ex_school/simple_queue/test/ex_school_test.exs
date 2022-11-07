defmodule ExSchoolTest do
  use ExUnit.Case
  doctest ExSchool

  test "greets the world" do
    assert ExSchool.hello() == :world
  end
end
