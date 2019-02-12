defmodule Wedsite.Utils do

  def gen_code(length) do
    length
      |> :crypto.strong_rand_bytes()
      |> Base.encode64
      |> binary_part(0, length)
  end

end
