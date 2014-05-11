=begin
SELF DESCRIBING NUMBERS
CHALLENGE DESCRIPTION:

A number is a self-describing number when (assuming digit positions are labeled 0 to N-1),
the digit in each position is equal to the number of times that that digit appears in the number.

INPUT SAMPLE:

The first argument is the pathname to a file which contains test data, one test case per line.
Each line contains a positive integer. E.g.

2020
22
1210
OUTPUT SAMPLE:

If the number is a self-describing number, print out 1. If not, print out 0. E.g.

1
0
1
For the curious, here's how 2020 is a self-describing number: Position '0' has value 2 and
there is two 0 in the number. Position '1' has value 0 because there are not 1's in the number.
Position '2' has value 2 and there is two 2. And the position '3' has value 0 and there are zero 3's.
=end
File.open(ARGV[0]).each_line do |line|
    count = Hash.new(0)
    is_self_describing = 1
    numbers = line.chomp.split(//).map { |num| num.to_i }
    numbers.each { |num| count[num] += 1 }

    numbers.each_with_index do |val, idx|
        if count[idx] != val
            is_self_describing = 0 #if count[idx] != val
            break
        end
    end
    puts is_self_describing
end
