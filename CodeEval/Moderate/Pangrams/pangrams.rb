@alphabet = ('a'..'z')

def is_pangram?(str)
  str_chars = str.chars.map(&:strip).reject(&:empty?).map(&:downcase).sort.uniq
  if @alphabet.to_a - str_chars == []
    puts 'NULL'
  else
    puts (@alphabet.to_a - str_chars).sort.map(&:downcase).join
  end
end
File.open(ARGV[0]).each_line do |line|
  is_pangram? (line) unless line.chomp.empty?
end