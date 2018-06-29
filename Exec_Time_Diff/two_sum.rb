def two_sum(arr, target)
  arr.each_index do |i|
    next if i + 1 == arr.length
    arr.drop(i + 1).each_index do |j|
      return true if arr[i] + arr[j+i+1] == target
    end
  end

  false
end

def binary_search(arr, target)
  return nil if arr.empty?

  middle = arr.length / 2

  case target <=> arr[middle]
  when -1
    binary_search(arr.take(middle),target)
  when 0
    arr[middle]
  when 1
    result = binary_search(arr.drop(middle + 1),target)
    result.nil? ? nil : result + middle + 1
  end
end

def better_two_sum(arr, target)
  sorted = arr.sort

  sorted.each_index do |i|
    array = sorted[0...i] + sorted[i+1..-1]
    return true if binary_search(array, target - sorted[i])
  end

  false
end
