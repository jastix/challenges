File.open(ARGV[0]).each_line do |line|
  days, data = line.chomp.split(';')
  data = data.split(' ').map(&:to_i)
  data_split = []
  data.length.times do
    if data.length < days.to_i
      break
    else
      day = []
      day << data.take(days.to_i)
      data.shift
      data_split << day.flatten
    end
  end
  result = data_split.map { |d| d.reduce(0, :+) }.max
  puts result < 1 ? 0 : result
end
