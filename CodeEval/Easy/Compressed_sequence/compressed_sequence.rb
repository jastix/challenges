File.open(ARGV[0]).each_line do |line|
    result = Array.new
    integers = line.chomp.split(' ')
    prev = nil
    counter = 1
    integers.each_with_index do |num, idx|
        if num == prev
            counter +=1
        else
            result << "#{counter} #{prev}" if idx > 0
            prev = num
            counter = 1
        end
        result << "#{counter} #{num}" if idx == integers.length-1
    end
    puts result.join(' ')
end
