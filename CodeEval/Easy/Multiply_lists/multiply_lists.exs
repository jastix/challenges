defmodule MyList do
  def open(argv) do
    parse_args(argv)
  end
  def parse_args(" "), do: []
  def parse_args(arg) do
    File.stream!(arg) |> Enum.each(fn(line) ->
      String.strip(line)
      |> String.split("|", trim: true)
      |> Enum.map(fn(x) -> String.split(x, " ", trim: true) end)
      |> Enum.map(fn(x) -> Enum.map(x, fn(y) -> Integer.parse(y) end) end)
      |> Enum.map(fn(x) -> Enum.map(x, fn({y, _z}) -> y end) end)
      |> List.zip
      |> Enum.map(fn({x, y}) -> Integer.to_string(x * y) end)
      |> Enum.join(" ")
      |> IO.puts
      end)
  end
end

MyList.open System.argv
