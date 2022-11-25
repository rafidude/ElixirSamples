defmodule Example do
  def read_file(file) do
    if File.exists?(file) do
      File.read!(file) |> IO.inspect
    end
  end

  def write_file(file) do
    if File.exists?(file) do
      File.write(file, "update2!", [:append]) |> IO.inspect
    else
      File.write(file, "new content!", [:write])
    end
  end

  def stream_file(file) do
    File.stream!(file)
      |> Stream.map( &(String.replace(&1, "\n", "")) )
      |> Enum.each(&IO.inspect/1)
  end

  def file_with_line_nums(file) do
    File.stream!(file)
      |> Stream.map( &(String.replace(&1, "\n", "")) )
      |> Stream.with_index
      |> Enum.each( fn({contents, line_num}) ->
           IO.puts "#{line_num + 1} #{contents}"
         end)
  end
end
