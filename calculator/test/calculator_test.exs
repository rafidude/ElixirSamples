defmodule CoreTest do
  use ExUnit.Case
  import Calculator.Core

  test "subtracts" do
    assert subtract(10, 4) == 6
  end

  test "adds" do
    assert add(10, 4) == 14
  end

  test "multiplies" do
    assert multiply(10, 4) == 40
  end

  test "divides" do
    assert divide(10, 2) == 5.0
  end

  test "negates" do
    assert negate(10) == -10
  end

  test "increments" do
    assert inc(10) == 11
  end

  test "decrements" do
    assert dec(10) == 9
  end

  test "fold" do
    assert fold([1, 2, 3, 4], 0, &add/2) == 10
  end
end
