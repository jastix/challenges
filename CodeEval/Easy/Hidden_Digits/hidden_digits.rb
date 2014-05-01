def char_to_num(char)
    case char
    when "a"
        return '0'
    when "b"
        return '1'
    when "c"
        return '2'
    when "d"
        return '3'
    when "e"
        return '4'
    when "f"
        return '5'
    when "g"
        return '6'
    when "h"
        return '7'
    when "i"
        return '8'
    when "j"
        return '9'
    when /^[0-9]+$/
        return char
    end
end
File.open(ARGV[0]).each_line do |line|
    result = []
    result = line.chomp.split(//).map { |ch| char_to_num(ch) }.reject(&:nil?)
    puts result.empty? ? "NONE" : result.join
end
