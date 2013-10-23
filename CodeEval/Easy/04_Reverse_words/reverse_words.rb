def reverse(line)
  line.split.reverse.inject { |str, word| str + ' ' + word }
end

File.open(ARGV[0]).each_line do |line|
  puts reverse(line) unless line.strip.empty?
end