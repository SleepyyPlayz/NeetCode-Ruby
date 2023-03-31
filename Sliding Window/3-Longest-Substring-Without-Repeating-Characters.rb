require 'set'

# @param {String} s
# @return {Integer}
def length_of_longest_substring(s)
  # Handling s being an empty string, now we can assume s is non-empty
  return 0 if s.length == 0

  ptr_start = 0  # pointer to start of current substring
  curr_length = 1
  max_length_so_far = 1

  bag = Set[ s[0] ]  # the characters in the current string

  (1..(s.length - 1)).each do |i|
    unless bag.member?(s[i]) then
      # this character is not in the bag, expand our current string!
      curr_length += 1
      max_length_so_far = curr_length if curr_length > max_length_so_far

      bag.add(s[i])
    else
      # this character is already in the bag, reset our string adjust our starting point!
      # move our starting point until the character encountered is removed from the current
      # subtring
      while s[ptr_start] != s[i] do
        bag.delete(s[ptr_start])
        ptr_start += 1
        curr_length -= 1
      end
      ptr_start += 1
    end
  end

  return max_length_so_far

end
