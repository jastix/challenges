def mth_to_last_el(arr, idx)
  puts arr[arr.size - idx.to_i]
end

File.open(ARGV[0]).each_line do |line|
  unless line.chomp.empty?
    content = line.split(' ')
    if content.last.to_i <= content.size - 1
      arr = content[0..(content.size - 2)]
      idx = content.last
      mth_to_last_el(arr, idx)
    end
  end

end