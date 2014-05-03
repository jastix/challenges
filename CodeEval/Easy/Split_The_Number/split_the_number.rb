File.open(ARGV[0]).each_line do |line|
    nums, mask = line.chomp.split(' ')
    operation = mask.index(/[+|-]/)
    puts nums[0...operation].to_i.send(:"#{mask[operation]}",nums[operation...nums.length].to_i)
end
