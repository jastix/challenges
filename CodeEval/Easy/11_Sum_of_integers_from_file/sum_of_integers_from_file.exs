result =  File.stream!("input")
          |> Stream.flat_map(&String.split(&1, "\n"))
          |> Stream.filter(fn x -> x != "" end)
          |> Stream.map(&String.to_integer(&1))
          |> Enum.sum

IO.puts result
