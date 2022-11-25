defmodule Animal do
  defstruct species: "", name: "", age: 0
end

defmodule Zoo do
  defstruct title: "", animals: []

  defimpl Enumerable do
    def count(%Zoo{animals: animals}) do
      {:ok, Enum.count(animals)}
    end

    def member?(%Zoo{title: _, animals: animals}, animal) do
      {:ok, Enum.member?(animals, animal)}
    end
  end
end

defmodule Main do
  def run do
    my_zoo = %Zoo{
      title: "Demo Zoo",
      animals: [
        %Animal{species: "tiger", name: "Tigga", age: 5},
        %Animal{species: "horse", name: "Amazing", age: 3},
        %Animal{species: "deer", name: "Bambi", age: 2}
      ]
    }
    Enum.count(my_zoo) |> IO.inspect
    Enum.member?(my_zoo, %Animal{species: "tiger", name: "Tigga", age: 5}) |> IO.inspect
  end
end

Main.run
