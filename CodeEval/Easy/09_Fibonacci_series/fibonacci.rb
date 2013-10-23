def fib(n)
  if n < 2
    n
  else
    vals = [0, 1]
    (n-1).times do
      vals.push(vals[-1] + vals[-2])
    end
    return vals.last
  end
end

File.open(ARGV[0]).each_line do |line|
  puts fib(line.to_i)
end