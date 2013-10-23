File.open(ARGV[0]).each_line do |line|
  params = line.split(';')
  puts (params[0].split(',') & params[1].split(',')).join(',')
end