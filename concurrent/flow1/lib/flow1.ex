defmodule Flow1 do
  def files_word_count do
    streams = for file <- File.ls!("./input/") do
      File.stream!("./input/#{file}", read_ahead: 100)
    end

    streams
      |> Flow.from_enumerables()
      |> Flow.flat_map(&String.split(&1, " "))
      |> Flow.map(&String.downcase(String.trim(&1)))
      |> Flow.partition()
      |> Flow.reduce(fn -> %{} end, fn word, acc ->
        Map.update(acc, word, 1, & &1 + 1)
      end)
      |> Enum.to_list()
  end
end
