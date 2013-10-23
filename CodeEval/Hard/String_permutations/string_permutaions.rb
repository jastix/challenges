def permute_string(str)
  result = []
  str.chars.to_a.permutation.sort.each { |s| result << s.join}
  return result
end

File.open(ARGV[0]).each_line do |line|
  puts permute_string(line.chomp).join(',') unless line.chomp.empty?
end