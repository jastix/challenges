# Fast doubling fibonacci algorithm

def count_stairs(n)
  if n < 0
    raise StandardError, 'Negative argument'
  end
  fib(n)[1]
end

def fib(n)
  if n == 0
    [0, 1]
  else
    a, b = fib(n/2)
    c = a * (2 * b - a)
    d = b * b + a * a
    if n % 2 == 0
      [c, d]
    else
      [d, c + d]
    end
  end
end

File.open(ARGV[0]).each_line do |line|
  puts count_stairs(line.chomp.to_i) unless line.chomp.empty?
end