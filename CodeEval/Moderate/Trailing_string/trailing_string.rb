def compare(str, target)
  str[/#{target}\Z/].nil? ? (puts 0) : (puts 1);
end

File.open(ARGV[0]).each_line do |line|
  if !line.chomp.empty?
    params = line.chomp.split(',')
  else
    params = nil
  end
  compare(params[0], params[1].chomp) if params
end