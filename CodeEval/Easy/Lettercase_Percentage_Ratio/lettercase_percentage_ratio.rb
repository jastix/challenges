File.open(ARGV[0]).each_line do |line|
  uppercase, lowercase = line.chomp.chars.partition { |ch| ch == ch.upcase }
  lowercase_ratio = (lowercase.length * 1.0 / line.chomp.length) * 100
  uppercase_ratio = (uppercase.length * 1.0 / line.chomp.length) * 100
  puts "lowercase: #{sprintf("%.2f", lowercase_ratio)} uppercase: #{sprintf("%.2f", uppercase_ratio)}"
end
