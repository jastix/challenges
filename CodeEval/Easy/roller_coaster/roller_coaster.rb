def flip(num)
  num == 0 ? 1 : 0
end

def roller(ch)
    if (ch =~ /[A-Za-z]/) == 0
      ch = @upper == 1 ? ch.upcase : ch.downcase
      @upper = flip(@upper)
    end
    ch
end
File.open(ARGV[0]).each_line do |line|
  @upper = 1
  new_line = line.chars.map { |ch| roller(ch) }
  puts new_line.join
end
