#*Challenge Description:*
#You have a list of words. Letters of these words are mixed with
#extra symbols, so it is hard to define the beginning and end
#of each word. Write a program that will clean up the words from
#extra numbers and symbols.
#*Input sample:*
#The first argument is a path to a file. Each line includes a
#test case with a list of words: letters are both lowercase and
#uppercase, and are mixed with extra symbols.
#Input example is the following
# ========
#(--9Hello----World...--)
#Can 0$9 ---you~
#13What213are;11you-123+138doing7
# ========
#
#*Output sample:*
# Print the cleaned up words separated by spaces in lowercase letters.
# ========
# hello world
# can you
# what are you doing
# ========

File.open(ARGV[0]).each_line do |line|
  unless line.chomp.empty?
    puts line.scan(/([[:alpha:]]+)/).join(' ').downcase
  end
end
