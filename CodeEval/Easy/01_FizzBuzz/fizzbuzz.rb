def fizzbuzz(a, b, n)
result = ''
  (1..n).each do |num|
    if num % (a * b) == 0
      result << 'FB '
    elsif num % a == 0
      result << 'F '
    elsif num % b == 0
      result << 'B '
    else
      result << num.to_s + ' '
    end
  end
  puts result.rstrip
end
File.open(ARGV[0]).each_line do |line|
  params = line.split
  fizzbuzz(params[0].to_i, params[1].to_i, params[2].to_i)
end