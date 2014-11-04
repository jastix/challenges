# You are given the pairs of time values. The values are in the HH:MM:SS format
# with leading zeros. Your task is to find out the time difference between the pairs.
def to_seconds(timestamp)
  hours = timestamp[0].to_i * 60 * 60
  minutes = timestamp[1].to_i * 60
  hours + minutes + timestamp[2].to_i
end

def to_time(seconds)
  hours   = seconds.divmod(3600)
  minutes = hours[1].divmod(60) 
  seconds = minutes[1]

  format_hours   = sprintf("%02d", hours[0])
  format_minutes = sprintf("%02d", minutes[0])
  format_seconds = sprintf("%02d", seconds)

  [format_hours, format_minutes, format_seconds]
end

File.open(ARGV[0]).each_line do |line|
  first, second = line.split(' ')
  diff = (to_seconds(first.split(':')) - to_seconds(second.split(':'))).abs
  puts to_time(diff).join(':')
end
