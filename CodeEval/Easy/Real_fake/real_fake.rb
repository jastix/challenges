def is_valid?(sum)
  sum % 10 == 0
end

File.open(ARGV[0]).each_line do |line|
    card_number = line.chomp.chars.reject! { |el| el == ' ' || el.nil? }.map(&:to_i)
    indexes = 0.step(by: 2, to: (card_number.size - 1)).to_a
    sum_each_third = indexes.map { |idx| card_number[idx] * 2 }.reduce(:+)
    not_doubled_idxs = (0...card_number.size).to_a - indexes
    sum_rest = not_doubled_idxs.map { |idx| card_number[idx] }.reduce(:+)
    sum = sum_each_third + sum_rest

    puts(is_valid?(sum) ? "Real" : "Fake")
end
