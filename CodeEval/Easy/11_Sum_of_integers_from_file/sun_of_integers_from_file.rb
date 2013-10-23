nums = File.readlines(ARGV[0])
puts nums.map(&:to_i).reduce(&:+)