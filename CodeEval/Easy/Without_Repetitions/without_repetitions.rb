#*Challenge Description:*
# In a given text, if there are two or more identical characters
# in sequence, delete the repetitions and leave only the first character.
# Example:
#Shellless mollusk lives in wallless house in wellness. Aaaarrghh!
#↓
#Sheles molusk lives in wales house in welnes. Aargh!

File.open(ARGV[0]).each_line do |line|
  unless line.chomp.empty?
    newline = []
    line.split(' ').each do |word| 
      repetitions = word.scan(/((.)\2+)/)
      if repetitions
        repetitions.each { |rep| word.gsub!(rep[0], rep[1]) }
      end
      newline << word
    end
    puts newline.join(' ')
  end
end
