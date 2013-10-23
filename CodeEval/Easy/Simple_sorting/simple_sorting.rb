def format(arr)
  arr.map! do |num|
    '%.3f' % num
  end
  arr.join(' ')
end

def insertionsort(numbers)
  (numbers.length-1).times do |i|
    nex = numbers[i+1]
    j = i
    while j >= 0 && numbers[j] > nex
      numbers[j+1] = numbers[j]
      j = j-1
    end
    numbers[j+1] = nex
  end
  return numbers
end

File.open(ARGV[0]).each_line do |line|
  unless line.chomp.empty?
    nums = line.chomp.split(' ').map(&:to_f)
    result = insertionsort(nums)
    puts format(result)
  end
end


