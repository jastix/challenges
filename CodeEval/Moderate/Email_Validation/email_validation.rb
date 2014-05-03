File.open(ARGV[0]).each_line do |line|
    if (/^((["]*[\S]*[\.]+[\S]*[\.]+[\S]*["])|(\w*[\w+|.]))+@\w+[.a-zA-Z![#][$]%*\/?^`{|}~.]{2,}$/i =~ line.chomp)
        puts "true"
    else
        puts "false"
    end
end
