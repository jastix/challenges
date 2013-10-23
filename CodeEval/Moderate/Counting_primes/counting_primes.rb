require 'prime'

def get_primes(start, finish)
  Prime::EratosthenesGenerator.new.take_while {|x| x <= finish }.delete_if { |n| n < start }
end

File.open(ARGV[0]).each_line do |line|
  unless line.chomp.empty?
    params = line.chomp.split(',')
    pr = get_primes(params[0].to_i, params[1].to_i)
    puts pr.length
  end
end
