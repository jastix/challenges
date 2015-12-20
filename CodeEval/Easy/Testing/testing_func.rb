def classify_bug(counter)
  case
  when counter == 0
    "Done"
  when counter <= 2
    "Low"
  when counter <= 4
    "Medium"
  when counter <= 6
    "High"
  else
    "Critical"
  end
end

def compare(arr)
  (arr.first <=> arr.last).abs
end

File.open(ARGV[0]).each_line do |line|
  input = line.chomp.split(' | ')
  dev_line = input[0].chars.to_a.map(&:to_s)
  test_line = input[1].chars.to_a.map(&:to_s)

  counter = dev_line.zip(test_line).map(&method(:compare)).reduce(&:+)

  puts classify_bug(counter)
end

