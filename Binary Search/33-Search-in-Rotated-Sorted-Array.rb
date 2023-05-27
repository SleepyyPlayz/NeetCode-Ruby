# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
def search(nums, target)
  l = 0
  r = nums.length - 1

  while l <= r do
    mid = (l + r) / 2
    return mid if nums[mid] == target  # target is found

    if nums[l] <= nums[mid] then
      if nums[l] <= target && target <= nums[mid] then
        r = mid - 1
      else
        l = mid + 1
      end
    else
      if nums[mid] <= target && target <= nums[r] then
        l = mid + 1
      else
        r = mid - 1
      end
    end
  end

  return -1  # target is not found
end
