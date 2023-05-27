# @param {Integer[]} nums
# @return {Integer}
def find_min(nums)
  # Edge case 1: array only has 1 element
  return nums.first if nums.length == 1

  # Edge case 2: mininum is the first element of the array
  return nums.first if nums.last > nums.first

  # Only the minimum element is smaller than the element on its left
  # (or it could be the first element of the array)
  l = 0
  r = nums.length

  while l < r do
    mid = (l + r) / 2  # establish the "mid" index

    # Situation 0: nums[mid] < nums[mid - 1], the the number is the minimum
    return nums[mid] if nums[mid] < nums[mid - 1]

    # Situation 1: nums.first < nums[mid], the min is to the RIGHT of it
    l = mid + 1 if nums.first < nums[mid]
    
    # Situation 2: nums.first > nums[mid], the min is to the LEFT of it, (or the element itself)
    r = mid if nums.first > nums[mid]
  end

  # Situation 3: (shouldn't get here but) l == r, what remains is the minimum
  return nums[l]
  
end
