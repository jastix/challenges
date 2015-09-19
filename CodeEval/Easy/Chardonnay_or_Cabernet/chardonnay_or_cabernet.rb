# The first argument is a path to a file. Each line includes a test case,
# which contains names of wines and letters that Tom remembers. Names and
# letters are separated by a vertical bar '|'.

# For example:
#Cabernet Merlot Noir | ot
#Chardonnay Sauvignon | ann
#Shiraz Grenache | o
#
# OUTPUT SAMPLE:
#
# You should print wine names, containing all letters that Tom remembered.
# Letters can be anywhere in wine names. If there is no name with all letters,
# print False. 
File.open(ARGV[0]).each_line do |line|
  input = line.chomp.split('|')
  names = input[0].strip.split
  partial_names = Hash.new(0)
  input[1].strip.chars.to_a.each do |ch|
    partial_names[ch] += 1
  end

  result = []
  names.each do |name| 
    name_chars = name.chars.to_a.inject(Hash.new(0)) { |total, el|  total[el] +=1; total  }
    if partial_names.map { |p| name_chars[p[0]] && name_chars[p[0]] >= p[1] }.all?
      result << name
    end
  end

  # partial
  # names.each do |name| 
  #   if partial_names.map { |part| /([\s|\w]?#{part[0]}[\s|\w]?){#{part[1]}}/ =~ name }.all?
  #     result << name
  #   end
  # end
    
  puts result.empty? ? "False" : result.join(' ')
end

