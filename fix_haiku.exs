defmodule FixFile do
  def fix_file(file) do
    {:ok, contents} = File.read(file)
    fixed = contents |> String.trim |> String.split("\n") |> Enum.map(&String.reverse/1) |> Enum.join("\n")
    File.write("fixed.txt", fixed)
  end
end

FixFile.fix_file("haiku.txt")
