# dynamic programming approach.
# Bottom-top way.
# Look at first pair, choose max, sum max with the adjacent cell in the next row.
# The last row with one cell will contain the answer.

def compute(triangle)
  line = 0
  while line < triangle.length-1
    triangle[line+1].each_index do |idx|
      triangle[line+1][idx] += [triangle[line][idx], triangle[line][idx+1]].max
      end
    line += 1
  end
  return triangle[line]
end

triangle = []

File.open(ARGV[0]).each_line do |line|
    unless line.chomp.empty?
      triangle << line.chomp.split(' ').map(&:to_i)
    end
end
puts compute(triangle.reverse)
