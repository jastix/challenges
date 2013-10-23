def number_pairs(nums, sum)
  if nums.reduce(&:+) < sum
    puts 'NULL'
  else
    result = []
    nums.combination(2).to_a.keep_if {|comb| comb.reduce(&:+) == sum}.each do |num|
      result << "#{num[0]},#{num[1]}"
    end
    puts result.join(';')
  end
end

File.open(ARGV[0]).each_line do |line|
  params = line.split(';')
  number_pairs(params[0].split(',').map(&:to_i), params[1].to_i)
end