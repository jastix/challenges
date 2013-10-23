File.open(ARGV[0]).each_line do |line|
  input = line.chomp.split('|')
  vocab = input[0].chars.to_a
  indexes = input[1].split.to_a.map(&:to_i)

  name = []
  indexes.each do |idx|
    name << vocab[idx-1]
  end
  puts name.join('')
end
