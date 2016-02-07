defmodule LuhnTest do
  use ExUnit.Case
  doctest Luhn

  test "removes whitespace" do
    string = "5537 0213 6797 6815"
    assert Luhn.remove_whitespace(string) == "5537021367976815"
  end

  test "doubles every second digit" do
    original = "5537021367976815"
    expected = ["5", "10", "3", "14", "0", "4", "1", "6", "6", "14", "9", "14", "6", "16", "1", "10"]
    assert Luhn.double_every_second_digit(original) == expected
  end

  test "sums every double number" do
    original = ["5", "10", "3", "14", "0", "4", "1", "6", "6", "14", "9", "14", "6", "16", "1", "10"]
    expected = ["5", "1", "3", "5", "0", "4", "1", "6", "6", "5", "9", "5", "6", "7", "1" ,"1"]
    assert Luhn.sum_double_numbers(original) == expected
  end

  test "sums all the digits" do
    original = ["1", "4", "1", "3", "9"]
    expected = 18
    assert Luhn.sum_digits(original) == expected
  end

  test "prints 1 if valid number" do
    assert Luhn.is_valid?(0) == "1"
  end
  test "prints 0 if not a valid number" do
    assert Luhn.is_valid?(5) == "0"
  end

  test "are valid numbers" do
    valid_numbers = [
      "6370 1675 9034 6211 774",
      "1556 9144 6285 339",
      "5121073173806787",
      "5537 0213 6797 6815",
      "5494030408028727",
      "4764672409896895"
    ]
    Enum.each(valid_numbers, fn(num) ->
      assert Luhn.check_validity(num) == "1"
    end)
  end
end
