# You must have heard about pirates, their customs, pirates code,
# and the “black spot”. If a pirate is presented with a “black spot”, he is
# officially pronounced guilty, meaning he will soon be expulsed from the pirate
# brotherhood or even be dead.
# We don’t have as strict rules as pirates have, and a person who receives a black
# spot simply leaves the game.
# For example, we have a list of three players: John, Tom, Mary, and a number 5.
# Starting with the first player (in our case, it’s John), we start to count all
# players: John – 1, Tom – 2, Mary – 3, and then again starting from the first
# one John – 4, Tom – 5. As Tom gets number 5, he should leave. Now, we have
# John and Mary and start counting again. John gets number 5, so he leaves.
# Thus, the winner is Mary.

def find_winner(names, turns)
  if names.size == 1
    names.first
  else
    names.delete_at(remove_name(names, turns))
    find_winner(names, turns)
  end
end

def remove_name(names, turns)
  if names.size > turns
    turns
  else
    remove_name(names, turns - names.size)
  end
end
File.open(ARGV[0]).each_line do |line|
  input = line.chomp.split('|')
  names = input[0].strip.split
  turns = input[1].to_i - 1

  puts find_winner(names, turns)
end

