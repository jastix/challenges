def reverse_groups(line, block_size)
  line.split(',').each_slice(block_size).to_a.each do |group|
    group.reverse! if group.length == block_size
  end.join(',')
end

File.open(ARGV[0]).each_line do |line|
  unless line.chomp.empty?
    params = line.chomp.split(';')
    block_size = params[1].to_i
    puts reverse_groups(params[0], block_size)
  end
end
