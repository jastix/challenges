require 'prime'

def calc_primes(n)
  primes = Prime::EratosthenesGenerator.new.take_while { |x| x < n }
end

File.open(ARGV[0]).each_line do |line|
  puts calc_primes(line.chomp.to_i).join(',') unless line.chomp.empty?
end