# @param {String} s1
# @param {String} s2
# @return {Boolean}
def check_inclusion(s1, s2)
  # The idea is to use a sliding window and check if the current
  # substring has the same letter counts as the string given.
  # And since we know the domain of our strings (lowercase letters),
  # checking validity takes constant time.
  # Also note that the window is always of the same length

  # Edge case, s2.length < s1.length
  return false if s2.length < s1.length

  # First we examing s1, and extract its letter count
  s1_count = Array.new(26, 0)
  s1.each_char {|c| s1_count[ c.ord - 97 ] += 1}

  p_left = 0  # pointer to left-most character of substring
  p_right = s1.length - 1  # pointer to right-most character

  curr_count = Array.new(26, 0)  # letter count of current substring
  (p_left..p_right).each {|i| curr_count[ s2[i].ord - 97 ] += 1}
  
  while p_right < s2.length do
    # If the letter compositions are the same, then return true
    return true if s1_count == curr_count

    # Shift the window to the right by 1,
    # but we need to check if the substring is "shiftable"
    if p_right < (s2.length - 1) then
      curr_count[ (s2[p_left].ord - 97) ] -= 1
      p_left += 1

      p_right += 1
      curr_count[ (s2[p_right].ord - 97) ] += 1
    else
      # not shiftable AND already checked letter composition
      return false
    end
  end
  
  return false
end

