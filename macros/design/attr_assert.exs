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

defmodule Assertion do

  defmacro assert({operator, _, [lhs, rhs]}) do
    quote bind_quoted: [operator: operator, lhs: lhs, rhs: rhs] do
      Assertion.Test.assert(operator, lhs, rhs)
    end
  end

  defmacro __using__(_options) do
    quote do
      import unquote(__MODULE__)
      Module.register_attribute __MODULE__, :tests, accumulate: true
      @before_compile unquote(__MODULE__)
    end
  end

  defmacro __before_compile__(_env) do
    quote do
      def run do
        IO.puts "Running the tests (#{inspect @tests})"
      end
    end
  end

  defmacro test(description, do: test_block) do
    test_func = String.to_atom(description)
    quote do
      @tests {unquote(test_func), unquote(description)}
      def unquote(test_func)(), do: unquote(test_block)
    end
  end
  # ...
end

defmodule MathTest do
  use Assertion

  test "integers can be added and subtracted" do
    assert 1 + 1 == 2
    assert 2 + 3 == 5
    assert 5 - 5 == 10
  end
end

MathTest.__info__(:functions)

MathTest.run
