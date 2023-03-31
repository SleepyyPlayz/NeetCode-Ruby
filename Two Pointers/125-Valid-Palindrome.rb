# @param {String} s
# @return {Boolean}
def is_palindrome(s)
  # First we filter out all non-alphanumeric characters string,
  # as well as changing all characters to lower-case,
  # then we compare the string to its reverse counterpart.

  # helper array, collection of valid characters
  alnum_chars = ('a'..'z').to_a + ('A'..'Z').to_a + ('0'..'9').to_a
  
  str = s.chars .filter{ |c| alnum_chars.include?(c) } .join .downcase
  
  return str == str.reverse

end
