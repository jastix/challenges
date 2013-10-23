# Write a program which checks input numbers and determines whther a number is even or not.
#
# Solution using bitwise operators.
# Least Significant bit is always set for odd numbers and cleared for even numbers.:w
def is_even?(num)
  (num & 1) == 0 ? '1' : '0'
end

File.open(ARGV[0]).each_line do |line|
  puts is_even?(line.chomp.to_i)
end
