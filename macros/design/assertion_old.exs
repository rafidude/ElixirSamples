defmodule Assertion do
  defmacro assert({operator, _, [lhs, rhs]}) do
    quote bind_quoted: [operator: operator, lhs: lhs, rhs: rhs] do
      Assertion.Test.assert(operator, lhs, rhs)
    end
  end
end

defmodule Assertion.Test do
  def print_msg(type, lhs, rhs) do
    IO.puts """
    FAILURE:
      Expected:       #{lhs}
      to be #{type}:  #{rhs}
    """
  end

  def assert(:==, lhs, rhs) when lhs == rhs do
    IO.write "."
  end

  def assert(:==, lhs, rhs) do
    print_msg("equal to", lhs, rhs)
  end

  def assert(:>, lhs, rhs) when lhs > rhs do
    IO.write "."
  end

  def assert(:>, lhs, rhs) do
    print_msg("greater than", lhs, rhs)
  end
end

defmodule Functionality do
  require Assertion
  def run do
    Assertion.assert 2 > 1
    Assertion.assert 1 > 2
    Assertion.assert 5 == 5
    Assertion.assert 5 == 8
  end
end

defmodule MathTest do
  import Assertion

  def run do
    assert 5 == 5
    assert 10 > 0
    assert 1 > 2
    assert 10 * 10 == 100
  end
end

Functionality.run()
MathTest.run()
