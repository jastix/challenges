UNHAPPY_NUMBERS = [0, 4, 16, 20, 37, 42, 58, 89, 145]

def check_happy(num)
  return 1 if num == 1
  return 0 if UNHAPPY_NUMBERS.include?(num)
end

def compute_happy(num)
  results = [num]
  until results.last == 1 or UNHAPPY_NUMBERS.include?(results.last)
    results << results.last.to_s.split('').map { |n| n.to_i }.map { |n| n ** 2 }.reduce(&:+)
  end
  check_happy(results.last)
end

File.open(ARGV[0]).each_line do |line|
  puts compute_happy(line.chomp)
end