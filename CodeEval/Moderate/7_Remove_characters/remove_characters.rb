File.open(ARGV[0]).each_line do |line|
  params = line.chomp.split(', ')
  puts params[0].delete(params[1])
end