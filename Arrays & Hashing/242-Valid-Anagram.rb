# @param {String} s
# @param {String} t
# @return {Boolean}
def is_anagram(s, t)
  # see if the two strings contain the same characters
  # the same amount of times, we can just sort the characters
  # alphabetically, then compare the two char arrays

  s_chars = s.chars.sort
  t_chars = t.chars.sort
  
  return t_chars == s_chars
end
