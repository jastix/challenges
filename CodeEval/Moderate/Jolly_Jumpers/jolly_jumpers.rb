def compute_differences(arr)
  diff = []
  arr.each_with_index {|item, index| diff << (arr[index + 1].to_i - item.to_i).abs unless arr[index + 1].nil? }
  diff
end

def detect_jolly(size, arr)
  diff = compute_differences(arr)
  values = (1..size-1).to_a
  if diff.sort == values.sort
    'Jolly'
  else
    'Not jolly'
  end
end

File.open(ARGV[0]).each_line do |line|
  unless line.chomp.empty?
    params = line.chomp.split(' ').map(&:to_i)
    puts detect_jolly(params[0], params[1..-1])
  end
end
