(1..12).each do |num|
  str = ''
  (1..12).each {|n| str += (num * n).to_s.rjust(4) }
  puts str.strip
end