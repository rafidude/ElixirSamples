defmodule FixFile do
  def fix_file(file) do
    {:ok, contents} = File.read(file)
    fixed = contents |> String.trim |> String.split("\n") |> Enum.map(&String.reverse/1) |> Enum.join("\n")
    File.write("fixed.txt", fixed)
  end

  def fix_file2(fname) do
    case File.read(fname) do
      {:ok, contents} ->
        fixed2 = contents
        |> String.trim
        |> String.split("\n")
        |> Enum.map(&String.reverse/1)
        |> Enum.join("\n")
        File.write("fixed2.txt", fixed2)
      {:error, reason} ->
        IO.puts "Error: #{reason}"
    end
  end
end

FixFile.fix_file2("haiku2.txt")
