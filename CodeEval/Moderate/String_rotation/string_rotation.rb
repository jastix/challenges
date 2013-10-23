#**String Rotation**
#Challenge Description:
#
#You are given two strings. Determine if the second string is a rotation of the
#first string.
#*Input sample:*
#
#Your program should accept as its first argument a path to a filename. Each
#line in this file contains two comma separated strings. e.g.
#```
#Hello,lloHe
#Basefont,tBasefon
#```
#*Output sample:*
#
#Print out True/False if the second string is a rotation of the first. e.g.
#```
#True
#True
#```

def compare(word, rotated)
  first_char_idx = rotated.chars.to_a.index(word[0])
  if first_char_idx && word == rotated.chars.to_a.rotate(first_char_idx).join
    return 'True'
  else
    return 'False'
  end
end

File.open(ARGV[0]).each_line do |line|
 unless line.chomp.empty?
   params = line.chomp.split(',')
   word, rotated = params[0], params[1]
   puts compare(word, rotated)
 end
end
