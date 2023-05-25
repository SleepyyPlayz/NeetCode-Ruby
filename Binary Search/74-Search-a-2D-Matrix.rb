# @param {Integer[][]} matrix
# @param {Integer} target
# @return {Boolean}
def search_matrix(matrix, target)
  # do binary search on the matrix flattened to an array
  arr = matrix.flatten
  index = binary_search_helper(arr, target)

  return false if index == -1
  return true
end

# Binary search, searching target within sorted array <nums>
# returns -1 if it is not found, otherwise returns the index of it 
# within the array
def binary_search_helper(nums, target)
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
