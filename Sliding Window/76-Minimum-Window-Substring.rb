# @param {String} s
# @param {String} t
# @return {String}
def min_window(s, t)
  # This is still a sliding window problem, but there's a difference
  # in approach, since we are no longer looking for the MAX, but the MIN.
  # 
  # The idea is to expand the window until we meet a valid substring, then
  # we immediately try to minimize it by shrinking it from the left, 
  # in pursuit of substrings shorter than the current one, until the substring
  # is no longer valid (or the left pointer passes the right pointer),
  # then we start expanding on the right again.

  # First we obtain the letter composition of t
  t_count = Hash.new(0)  # hash map with default value 0
  t.each_char { |c| t_count[c] += 1 }
  
  p_left = 0  # index of the left-most character in the substring
  curr_count = Hash.new(0)  # letter count of the substring
  
  min_substr = ""

  (0...s.length).each do |p_right|  # index of the right-most character in substring
    curr_count[ s[p_right] ] += 1

    while substr_is_valid(curr_count, t_count) and p_left <= p_right do
      # First update min_substr if necessary
      if (p_right - p_left + 1) < min_substr.length or min_substr == ""
        # This assignment statment might take O(n), and could be optimized
        # better by keepng track of the current substring in some way
        min_substr = s[p_left..p_right]  
      end

      # Then shrink from the left
      curr_count[ s[p_left] ] -= 1
      p_left += 1
    end
  end
  
  return min_substr
end

# @param {Hash} s_count  (letter count of current substring)
# @param {Hash} t_count  (letter count of string given)
# @return {TrueClass, FalseClass}
def substr_is_valid(s_count, t_count)
  t_count.each do |k, v|
    return false if s_count[k] < v
  end
  return true
end

