lines = []
File.open(ARGV[0]).each_line do |line|
  lines << [line.chomp, line.chomp.length] unless line.chomp.empty?
end
num = lines.shift[0].to_i
lines.sort_by {|e| e[1]}.reverse.take(num).each {|l| puts l[0]}
