defmodule Color do
  def hex_code(:white) do
    "#ffffff"
  end
  def hex_code(:black) do
    "#000000"
  end
  # def hex_code(color) do
  #   cond do
  #     color == :red -> "#ff0000"
  #     color == :green -> "#00ff00"
  #     color == :blue -> "#0000ff"
  #   end
  # end
  def hex_code(color) do
    case color do
      :red -> "#ff0000"
      :green -> "#00ff00"
      :blue -> "#0000ff"
    end
  end
end
