File.open(ARGV[0]).each_line do |line|
    result = Hash.new(0)
    elements = line.chomp.split(',')
    el_length = elements.length/2
    elements.each {|num| result[num] += 1 }
    res = result.find { |k, v| v > el_length }
    puts res ? res[0] : "None"
end
