def check_self_describing(num)
  num.to_s.split('').map { |n| n.to_i }
end

File.open(ARGV[0]).each_line do |line|
  puts compute_happy(line.chomp)
end