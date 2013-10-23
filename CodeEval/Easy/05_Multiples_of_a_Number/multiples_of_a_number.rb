def find_smallest_multiple(original, n)
  if original < n
    return n
  else
    find_smallest_multiple(original, n*2)
  end
end

File.open(ARGV[0]).each_line do |line|
  params = line.split(',')
  puts find_smallest_multiple(params[0].to_i, params[1].to_i)
end