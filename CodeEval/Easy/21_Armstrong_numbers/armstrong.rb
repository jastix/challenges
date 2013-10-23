def is_armstrong_number?(num)
  num_arr = num.chars.map(&:to_i)
  num_length = num.size
  arr_sum =  num_arr.inject { |sum, n| sum + n ** num_length }
  arr_sum.to_s == num ? 'True' : 'False'
end

File.open(ARGV[0]).each_line do |line|
    params = line.chomp 
    puts is_armstrong_number?(params) unless line.chomp.empty?
end
