defmodule MyModule do
  def decode_onechar(cipher) do
    de_char = for << char <- cipher >>, do: char - 1
    List.to_string(de_char)
  end

  def encode_onechar(cipher) do
    en_char = for << char <- cipher >>, do: char + 1
    List.to_string(en_char)
  end
end
