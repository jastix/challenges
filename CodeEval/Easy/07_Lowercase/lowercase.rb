File.open(ARGV[0]).each_line do |line|
  puts line.downcase unless line.nil?
end