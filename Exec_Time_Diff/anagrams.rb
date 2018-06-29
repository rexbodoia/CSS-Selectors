def first_anagram?(string1, string2)
  perms = permutations(string1)

  perms.include?(string2)
end

def permutations(string)
  return [string] if string.length <= 1

  last_el = string[-1]
  prev_perms = permutations(string[0..-2])

  perms = []

  prev_perms.each do |perm|
    (0..perm.length).each do |i|
      perms << perm[0...i] + last_el + perm[i..-1]
    end
  end

  perms
end

def second_anagram(string1, string2)
  i = 0
  while i < string1.length
    sliced = false
    j = 0
    while j < string2.length
      if string1[i] == string2[j]
        string1.slice!(i)
        string2.slice!(j)
        sliced = true
        break
      else
        j += 1
      end
    end

    i += 1 unless sliced
  end

  string1.empty? && string2.empty?
end

def third_anagram(string1, string2)
  sorted_s1 = merge_sort(string1)
  sorted_s2 = merge_sort(string2)
  sorted_s1 == sorted_s2
end

def merge_sort(string)
  prc = Proc.new {|x,y| x <=> y}
  return string if string.length <= 1
  middle = string.length / 2

  left = merge_sort(string[0...middle])
  right = merge_sort(string[middle..-1])

  merge(left, right, &prc)
end

def merge(left, right, &prc)
  result = ""

  until left.empty? || right.empty?
    case prc.call(left[0], right[0])
    when -1
      l = left.slice!(0)
      result += l
    when 0
      l = left.slice!(0)
      result += l
    when 1
      r = right.slice!(0)
      result += r
    end
  end
  result += left
  result += right
  result
end

def fourth_anagram(string1, string2)
  return false unless string1.length == string2.length
  hash = Hash.new { [0,0] }

  (0...string1.length).each do |i|
    hash[string1[i]][0] += 1
    hash[string1[i]][1] += 1
  end

  hash.each_value {|v| return false unless v[0] == v[1]}

  true
end
