def my_min(arr)
  # smallest = arr.first

  arr.each_index do |i|
    smaller = false
    arr.each_index do |j|
      next if i == j
      smaller = true if arr[j] < arr[i]
      # smallest = arr[j] if arr[j] < smallest
    end
    return arr[i] unless smaller
  end
end

def better_my_min(arr)
  smallest = arr.first

  arr.each {|el| smallest = el if el < smallest}

  smallest
end

require 'byebug'

def largest_contiguous_subsum(arr)
  sub_arrs = []

  arr.each_index do |i|
    sub_arrs << [arr[i]]
    next if i + 1 == arr.length

    (i + 1...arr.length).each do |j|
      sub_arrs << arr[i..j]
    end
  end

  largest = sub_arrs.first.first

  sub_arrs.each do |sub_arr|
    sum = sub_arr.reduce(:+)
    largest = sum if sum > largest
  end

  largest
end

def better_largest_contiguous_subsum(arr)
  subsum = arr.first
  skip_next = false

  (1...arr.length).each do |i|
    if skip_next
      skip_next = false
      next
    end

    if subsum + arr[i] > 0
      subsum += arr[i]
    elsif arr[i] > 0
      subsum = arr[i]
    else
      subsum = arr[i + 1]
      skip_next = true
    end
  end

  backwards_subsum = arr.last
  skip_next = false

  (arr.length - 2).downto(0) do |i|
    if skip_next
      skip_next = false
      next
    end

    if backwards_subsum + arr[i] > 0
      backwards_subsum += arr[i]
    elsif arr[i] > 0
      backwards_subsum = arr[i]
    else
      backwards_subsum = arr[i - 1]
      skip_next = true
    end
  end

  subsum > backwards_subsum ? subsum : backwards_subsum
end
