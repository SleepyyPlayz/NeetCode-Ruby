# @param {String} s
# @param {Integer} k
# @return {Integer}
def character_replacement(s, k)
  # This problem is again a classic sliding window problem.
  # General method of solving sliding windows:
  #   - Use 2 pointers (left & right), both starting at the beginning
  #   - Extend the window to the right as long as the window is valid
  #   - If the window becomes invalid upon an extension:
  #         retract the left pointer until the window is valid again,
  #   -     then begin extending the right pointer again
  #   - Do this until the right pointer reaches the end
  # 
  # Assuming the length of the array / iterable data structure is n.
  # Since the left and right pointers both iterate through at most n
  # positions, the total time complexity would be :
  #     2n * (time complexity of checking the validity of the current window)
  #
  # And since for this problem we know the domain of our characters, 
  # which has only 26 possibilities, we use a hash map (or array) 
  # to store how many of a certain character there are in the current window.
  # Thus checking the validity only takes constant time (26).

  p_left = 0    # pointer to the left-most character of substring
  # note that the substring is [p_left, p_right] INCLUSIVE
  # p_right is the loop variable in the main loop

  max_len_so_far = 0

  # array to record character count in current substring
  # count for character C is recorded at (C.ord - 65) [ascii]
  char_count = Array.new(26, 0)

  (0..(s.length - 1)).each do |p_right|  # pointer to the right-most character of substring
    current_len = p_right - p_left + 1  # length of current substring
    char_count[ (s[p_right].ord - 65) ] += 1  # record this new character in counter
    
    if substr_is_valid(current_len, char_count, k) then
      max_len_so_far = current_len if current_len > max_len_so_far  # update max len
    else
      # sub string is NOT valid, retract from the left until valid again
      until substr_is_valid(current_len, char_count, k) do
        char_count[ (s[p_left].ord - 65) ] -= 1
        p_left += 1
        current_len -= 1
      end
    end
  end

  return max_len_so_far
end

# @param {Integer} len (length of the substring)
# @param {Integer[]} char_count (character count array)
# @param {Integer} k (maximum num of substitutions allowed)
# @return {TrueClass, FalseClass}
def substr_is_valid(len, char_count, k)
  return (len - char_count.max) <= k
end

