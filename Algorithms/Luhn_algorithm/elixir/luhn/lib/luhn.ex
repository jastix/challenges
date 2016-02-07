defmodule Luhn do
  def main(argv) do
    parse_args(argv)
  end

  def parse_args(" "), do: []
  def parse_args(arg) do
    case File.exists?(arg) do
      true ->
        File.stream!(arg)
        |> Stream.map(fn(line) -> check_validity(line) end)
        |> Enum.each(fn(result) -> IO.puts(result) end)
      _ ->
        IO.puts "File not found"
    end
  end

  def check_validity(line) do
    String.strip(line)
    |> remove_whitespace
    |> String.reverse
    |> double_every_second_digit
    |> sum_double_numbers
    |> sum_digits
    |> rem(10)
    |> is_valid?
  end

  def remove_whitespace(string) do
    String.codepoints(string)
    |> Enum.reject(fn(x) -> x == " " end)
    |> List.to_string
  end

  def double_every_second_digit(string) do
    String.codepoints(string)
    |> Stream.chunk(2, 2, [])
    |> Enum.reduce([], fn(x, acc) -> acc ++ double_second_element(x) end)
    |> List.flatten
  end

  def sum_double_numbers(nums) do
    Enum.map(nums, fn(x) -> String.codepoints(x) |> sum_double_number end)
  end

  def sum_digits(list) do
    Stream.map(list, fn(x) -> String.to_integer(x) end)
    |> Enum.sum
  end

  def is_valid?(0), do: "1"
  def is_valid?(_), do: "0"
    
  defp double_second_element([a]),  do: [a]
  defp double_second_element([a,b]) do
    [a, (String.to_integer(b) * 2) |> Integer.to_string]
  end

  defp sum_double_number([a]), do: a
  defp sum_double_number([a, b]) do
    String.to_integer(a) + String.to_integer(b)
    |> Integer.to_string
  end
end
