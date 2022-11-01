file_name = "File name for word count: " |> IO.gets |> String.trim
contents = File.read!(file_name)

char_count = String.length(contents)

line_count =
  contents
  |> String.split("\n")
  |> Enum.count()

# Ignore the last line
line_count = line_count - 1

word_count =
  contents
  |> String.split()
  |> Enum.count()

IO.puts "Character Count: #{char_count}"
IO.puts "Line Count: #{line_count}"
IO.puts "Word Count: #{word_count}"
