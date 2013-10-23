def compute_ones(num)
  sum = 0
  num.each_char do |char|
    sum += 1 if char == '1'
  end
  sum
end

File.open(ARGV[0]).each_line do |line|
  puts compute_ones(line.to_i.to_s(2))
end