defmodule MyString do
  def open(argv) do
    parse_args(argv)
  end
  def parse_args(" "), do: []
  def parse_args(arg) do
    File.stream!(arg) |> Enum.each(fn(line) ->
      String.strip(line)
      |> find_words
      |> Enum.join(" ")
      |> String.downcase
      |> IO.puts
      end)
  end

  defp find_words(str) do
    Regex.scan(~r/\p{L}+/, str)
  end
end

MyString.open System.argv
