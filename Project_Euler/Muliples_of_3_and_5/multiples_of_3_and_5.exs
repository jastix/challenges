defmodule Multiples do
  def multiple_of_3_or_5?(num) do
    (rem(num, 3) == 0) || (rem(num, 5) == 0)
  end
end

result = 1..999
|> Stream.filter(&(Multiples.multiple_of_3_or_5?(&1)))
|> Enum.sum

IO.puts result
