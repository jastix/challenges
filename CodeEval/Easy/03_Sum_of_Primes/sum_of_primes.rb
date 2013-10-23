require 'prime'

primes = Prime::EratosthenesGenerator.new.take(1000)

def calc_sum_of_primes(arr)
  print arr.reduce(:+)
end

puts calc_sum_of_primes(primes)

