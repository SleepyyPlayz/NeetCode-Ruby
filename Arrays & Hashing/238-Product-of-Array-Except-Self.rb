# @param {Integer[]} nums
# @return {Integer[]}
def product_except_self(nums)
  # For this problem, we use 2 arrays to store the partial products, like so:

  # mult_before stores, for each element, products of elements 
  # strictly BEFORE the element
  # for the 1st element (index 0), this value is 1
  # e.g. for [2, 3, 4, 5] would be [1, 2, 2*3 = 6, (2*3)*4 = 24]
  mult_before = [1] * nums.length
  (1..(nums.length - 1)).each do |i| 
    mult_before[i] = mult_before[i - 1] * nums[i - 1]
  end

  # mult_after stores for each element, products of elements 
  # strictly AFTER the element
  # for the last element (index nums.length - 1), this value is 1
  # e.g. for [2, 3, 4, 5] would be [3*(4*5) = 60, 4*5 = 20, 5, 1]
  mult_after = [1] * nums.length
  (0..(nums.length - 2)).reverse_each do |i|
    mult_after[i] = mult_after[i + 1] * nums[i + 1]
  end

  # the result is calculated as such:
  result = []
  nums.each_index do |i|
    # before * after for each element at index i in nums
    result.push( mult_before[i] * mult_after[i] )  
  end

  return result

end
