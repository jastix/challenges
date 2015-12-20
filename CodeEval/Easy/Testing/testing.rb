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

File.open(ARGV[0]).each_line do |line|
  input = line.chomp.split('|')
  dev_line = input[0].strip.chars.to_a
  test_line = input[1].strip.chars.to_a

  bugs_counter = 0
  dev_line.each_with_index do |item, idx|
    bugs_counter += 1 if dev_line[idx] != test_line[idx]
  end

  puts classify_bug(bugs_counter)
end
