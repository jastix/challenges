File.open(ARGV[0]).each_line do |line|
  unless line.chomp.empty?
    words =  line.chomp.split(' ')
    puts words[words.length - 2]
  end
end
