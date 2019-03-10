defmodule Wedsite.Utils do

  def gen_code(length) do
    length
      |> :crypto.strong_rand_bytes()
      |> Base.encode64
      |> binary_part(0, length)
  end

  def randomizer(length) do
    alphabets = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    numbers = "0123456789"

    characters =
      alphabets <> String.downcase(alphabets) <> numbers
      |> String.split("", trim: true)


    do_randomizer(length, characters)
  end

  defp get_range(length) when length > 1, do: (1..length)
  defp get_range(length), do: [1]

  defp do_randomizer(length, characters) do
    get_range(length)
    |> Enum.reduce([], fn(_, acc) -> [Enum.random(characters) | acc] end)
    |> Enum.join("")
  end

end
