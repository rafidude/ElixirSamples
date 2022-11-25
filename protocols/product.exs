defmodule Product do
  defstruct title: "", price: 0

  defimpl String.Chars do
    def to_string(%Product{title: title, price: price}) do
      "#{title}, $#{price}"
    end
  end

  defimpl Inspect do
    def inspect(%Product{title: title, price: price}, _) do
      "That's a Product struct. It has a title of #{title} and a price of #{price}. Yay!"
    end
  end
end

defmodule Main do
  def run do
    %Product{title: "Test", price: 5} |> IO.puts
    %Product{title: "Test2", price: 52} |> IO.inspect
  end
end

Main.run
