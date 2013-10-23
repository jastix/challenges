def scan_string(str, char)
  regexp = Regexp.new(char)
  if str.rindex(regexp)
    return str.rindex(regexp)
  else
    '-1'
  end
end

File.open(ARGV[0]).each_line do |line|
  params = line.chomp.split(',')
  puts scan_string(params[0], params[1])
end