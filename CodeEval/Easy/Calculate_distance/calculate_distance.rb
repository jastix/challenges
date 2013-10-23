# You have coordinates of 2 points and need to find the distance between them.
def calculate_distance(point1, point2)
  dx = (point1[0].to_i - point2[0].to_i) ** 2
  dy = (point1[1].to_i - point2[1].to_i) ** 2
  Math.sqrt(dx + dy).to_i
end

File.open(ARGV[0]).each_line do |line|
  coord = line.chomp.scan(/(-{0,1}\d+),\s(-{0,1}\d+)/)
  puts calculate_distance(coord[0], coord[1])
end
