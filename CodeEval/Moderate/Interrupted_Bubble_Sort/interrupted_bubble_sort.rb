def bubble_sort(arr, threshold)
	swapped = false
	threshold.times do
		swapped = false
		arr.each_index do |idx|
			break if idx == arr.size - 1
			if arr[idx] > arr[idx + 1]
				arr[idx + 1], arr[idx] = arr[idx], arr[idx + 1]
				swapped = true
			end
		end
		break if swapped == false
	end
	arr
end


File.open(ARGV[0]).each_line do |line|
  arr, threshold = line.split('|')
  arr = arr.split(" ").map(&:to_i)
  threshold = threshold.to_i
  puts bubble_sort(arr, threshold).join(" ")
end