def frequency(str)
  freq = Hash.new(0)
  str.downcase.scan(/[a-z]/).each do |ch|
    freq[ch] += 1
  end
  freq.sort_by {|k, v| v }.reverse
end

def weights(dict)
  (26.downto(26 - dict.length+1)).each_with_index do |cost, idx|
    dict[idx][1] = cost
  end
  Hash[dict]
end

def beautify(str, dict)
  str.downcase.scan(/[a-z]/).inject(0) { |sum, n| sum + dict[n]}
end

File.open(ARGV[0]).each_line do |line|
      unless line.chomp.empty?
        puts beautify(line.chomp, weights(frequency(line.chomp)))
      end
end
