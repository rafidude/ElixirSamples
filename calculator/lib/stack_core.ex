defmodule Calculator.StackCore do
  def push(stack, element) do
    [element | stack]
  end

  def pop(stack) do
    [element | tail] = stack
    {element, tail}
  end
end
