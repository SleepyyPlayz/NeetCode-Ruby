# @param {Integer[]} nums
# @return {Integer}
def longest_consecutive(nums)
  # Insert each number in nums into a hash table to get a "sorted collection"
  # Since we are looking for consecutive sequences, we don't have to worry about duplicates.

  count = Hash.new 
  nums.each { |num| count[num] = true }

  longest_seq = 0
  # a number is only the start of a sequence if (number - 1) is NOT in the hash
  count.each_key do |num|
    if not count.has_key?(num - 1) then
    
      # now that we know that num is the start of a sequence, 
      # we check the length of the sequence starting at num
      curr_num = num
      curr_seq = 1
      while count.has_key?(curr_num + 1) do
        curr_num += 1
        curr_seq += 1
      end

      # update the length of the longest sequence so far, if applicable
      longest_seq = [longest_seq, curr_seq].max
    end
  end
  
  return longest_seq

end
