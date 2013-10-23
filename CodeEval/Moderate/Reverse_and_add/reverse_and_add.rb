def is_palindrome?(num)
  num.to_s == num.to_s.reverse
end

def add(num)
  @counter += 1
  num = num + num.to_s.reverse.to_i
end

def check_num(num)
  unless is_palindrome?(num)
    check_num(add(num))
  else
    "#{@counter} #{num}"
  end
end

File.open(ARGV[0]).each_line do |line|
  @counter = 0
  puts check_num(line.to_i) unless line.chomp.empty?
end
