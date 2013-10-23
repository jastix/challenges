#*Challenge Description:*
#Write a program which capitalizes words in a sentence.
#*Input sample:*
#Your program should accept as its first argument a path to a filename.
#Input example is the following
# ========
#Hello world
#javaScript language
#a letter
# ========
#
#*Output sample:*
#Print capitalized words in the following way:
# ========
#Hello World
#JavaScript Language
#A Letter
# ========

File.open(ARGV[0]).each_line do |line|
  unless line.chomp.empty?
    puts line.split(' ').each {|x| x[0] = x.capitalize[0]}.join(' ')
  end
end
