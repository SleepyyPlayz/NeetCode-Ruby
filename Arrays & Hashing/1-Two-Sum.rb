# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def two_sum(nums, target)
  # The intuition is to use a map (hash table) to store
  # which number is NEEDED to reach the target value
  # for each element's index in the list.

  # Then iterate through the array a second time to 
  # inspect whether an element meets the requirements.
  
  num_needed = Hash.new
  
  nums.each_index { |i| num_needed[i] = target - nums[i] }
  
  nums.each_index do |i|
    # the index of num[i]'s partner (if exists)
    corresponding_index = num_needed.key(nums[i])  

    if (not corresponding_index.nil?) and corresponding_index != i then
      return [i, corresponding_index]
    end
  end
  
end
