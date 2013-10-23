def find_first_non_repeated_char(str)
  str.chars.find { |char| str.count(char) == 1 }
end

File.open(ARGV[0]).each_line do |line|
  puts find_first_non_repeated_char(line.chomp) unless line.chomp.empty?
end