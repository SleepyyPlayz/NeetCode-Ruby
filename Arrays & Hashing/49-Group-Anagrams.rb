# @param {String[]} strs
# @return {String[][]}
def group_anagrams(strs)
  # We want to group each word according to its anagram group
  # Each string's hash key is equal to itself sorted alphabetically
  # e.g. "bat" and "tab" both have key "abt", thus they are anagrams

  word_group = Hash.new  # stores LISTS of words grouped according to their keys
  
  strs.each do |word|
    word_key = word.chars.sort.join  # key of the word

    # check if the word shares a key with some word already in the hash table
    if word_group.has_key?(word_key) then
      word_group[word_key].push(word)  # add it to the existing list
    else
      word_group[word_key] = [word]  # create a new list with the new key
    end
  end

  return word_group.values  # simply return the values in the hash 
  
end
