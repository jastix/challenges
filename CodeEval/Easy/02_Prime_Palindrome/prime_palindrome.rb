require 'prime'
require "benchmark"


def isPalindrome?(n)
  n.to_s == n.to_s.reverse
end

primes = Prime::EratosthenesGenerator.new.take_while { |i| i <= 10000 }

Benchmark.bmbm(25) do |x|
  x.report('find all') {
def find_prime_palindrome(arr)
  print arr.reverse.find_all { |i| isPalindrome?(i) }.max
end
}
end

 puts find_prime_palindrome(primes)

