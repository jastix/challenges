def sum_of_digits(num)
  num.to_s.split('').map(&:to_i).reduce(&:+)
end

File.open(ARGV[0]).each_line do |line|
  puts sum_of_digits(line) unless line.strip.empty?
end