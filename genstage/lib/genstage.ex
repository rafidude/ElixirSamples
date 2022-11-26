defmodule Genstage1 do
  require Flow
  # Inefficient memory wise for large files
  def eager do
    File.read!("source.txt")
    |> String.split("\n")
    |> Enum.flat_map(&String.split(&1))
    |> Enum.reduce(%{}, fn word, map ->
      Map.update(map, word, 1, & &1 + 1)
    end)
  end

  # Lazy stream based computation
  # Not concurrent
  def lazy do
    File.stream!("source.txt", [], :line)
    |> Stream.flat_map(&String.split(&1))
    |> Enum.reduce(%{}, fn word, map ->
      Map.update(map, word, 1, & &1 + 1)
    end)
  end

  def flow do
    File.stream!("source.txt", [], :line)
    |> Flow.from_enumerable()
    |> Flow.flat_map(&String.split(&1))
    |> Flow.partition()
    |> Flow.reduce(fn -> %{} end, fn word, map ->
      Map.update(map, word, 1, & &1 + 1)
    end)
    |> Enum.to_list()
  end
end
