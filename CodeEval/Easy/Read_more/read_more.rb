# CodeEval#Easy Read More
# You are given a text. Write a program which outputs its lines according to the following rules:
#
# If line length is ≤ 55 characters, print it without any changes.
# If the line length is > 55 characters, change it as follows:
#  - Trim the line to 40 characters.
#  - If there are spaces ‘ ’ in the resulting string, trim it once again to the last space (the space should be trimmed too).
#  - Add a string ‘... <Read More>’ to the end of the resulting string and print it.

File.open(ARGV[0]).each_line do |line|
  unless line.chomp.empty?
    if line.rstrip.length > 55
      idx = line[0...40].rindex(" ")
      line = idx == nil ? "#{line[0...40].rstrip}... <Read More>" : "#{line[0...idx]}... <Read More>" 
    end
    puts line
  end
end
