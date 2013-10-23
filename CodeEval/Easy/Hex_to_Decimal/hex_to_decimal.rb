File.open(ARGV[0]).each_line do |line|
  puts line.chomp.to_i(16) unless line.chomp.empty?
end