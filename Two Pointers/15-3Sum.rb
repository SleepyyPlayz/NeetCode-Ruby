# @param {Integer[]} nums
# @return {Integer[][]}
def three_sum(nums)
  # Similar to Two-Sum, except now we first set the first element,
  # then we determine the other two elements via the two-pointer method
  # TO THE RIGHT of the first element (otherwise there would be repeat results).

  result = {}  # a hash table being used as a set
  nums.sort!   # sorting nums, essential for the the two-pointer method

  # set the first element
  nums.each_with_index do |first, i_first|
    sum_required = 0 - first  # the sum required for the 2nd and 3rd elements

    # then try to find the next 2 elements 
    ptr_l = i_first + 1
    ptr_r = nums.length - 1

    while ptr_l < ptr_r do
      if nums[ptr_l] + nums[ptr_r] < sum_required then
        ptr_l += 1
      elsif nums[ptr_l] + nums[ptr_r] > sum_required then
        ptr_r -= 1
      else  # equals! 
        res = [first, nums[ptr_l], nums[ptr_r]]
        result[res] = true  # using the keys in the hash table as a set, ensures uniqueness
        ptr_l += 1
        ptr_r -= 1
      end
    end

  end

  return result.keys

end
