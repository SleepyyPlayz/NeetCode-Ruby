# @param {Integer[]} nums
# @return {Boolean}
def contains_duplicate(nums)
  # simply compare the length of the original array
  # with that of the array containing only unique elements

  nums_length = nums.length
  nums_uniq_length = nums.uniq.length

  return nums_length != nums_uniq_length
end
