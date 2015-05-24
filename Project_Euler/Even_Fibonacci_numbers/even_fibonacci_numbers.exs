import Integer, only: [is_even: 1]

result = Stream.unfold({0, 1}, fn {a, b} -> {a, {b, a + b}} end)
          |> Stream.filter(&(is_even(&1)))
          |> Enum.take_while(fn x -> x < 4_000_000 end)
          |> Enum.sum

IO.puts result
