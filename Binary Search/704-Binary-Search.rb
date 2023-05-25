# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
def search(nums, target)
  start_i = 0
  end_i = nums.length - 1
  
  while start_i <= end_i do
    mid_i = (start_i + end_i) / 2
    
    return mid_i if nums[mid_i] == target
    
    if target > nums[mid_i] then
      start_i = mid_i + 1
    else
      end_i = mid_i - 1
    end
  end

  return -1
end
