# To check whether a bank card number is valid or it is it just a set
# of random numbers, Luhn formula is used.
# The formula verifies a number against its included check digit,
# which is usually appended to a partial account number to generate
# the full account number. This account number must pass the following test:
# 1) From the rightmost digit, which is the check digit, moving left,
# double the value of every second digit; if the product of this doubling
# operation is greater than 9 (for example, 7×2=14),
# then sum the digits of the products (for example, 12:1+2=3, 14:1+4=5
# 2) Take the sum of all the digits.
# 3) If the total modulo 10 is equal to 0 (if the total ends in zero) then,
# according to the Luhn formula, the number is valid; otherwise,
# it is not valid.

def is_valid?(sum)
  sum % 10 == 0 ? 1 : 0
end

def sum_double_number(number)
  if number.to_s.chars.length == 2
    number.to_s.chars.map(&:to_i).reduce(:+)
  else
    number
  end
end

def sum_double_numbers(doubled_number)
  doubled_number.map { |num| sum_double_number(num) }
end

def double_every_second(card_number)
  card_number = card_number.reverse
  indexes = 1.step(by: 2, to: (card_number.size - 1)).to_a
  indexes.each { |idx| card_number[idx] *= 2 }
  card_number
end

File.open(ARGV[0]).each_line do |line|
  card_number = line.chomp.delete(' ').chars.map(&:to_i)
  doubled_seconds = double_every_second(card_number)
  doubled_number  = sum_double_numbers(doubled_seconds)
  doubled_sum     = doubled_number.reduce(:+)

  puts is_valid?(doubled_sum)
end
