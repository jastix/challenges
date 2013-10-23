file_path = ARGV[0]
file = File.open(File.expand_path(file_path), 'r')

def find_dups(arr)
  arr.find { |num| arr.count(num) == 2 }
end

def find_dups(arr)
  arr.find {|num| arr.count(num) == 2}
end

file.each_line do |line|
  unless line.chomp.empty?
    params = line.split(';')
    puts find_dups(params[1].split(',').map(&:to_i))
  end
end
