# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer[]}
def max_sliding_window(nums, k)
  # When we shift the window one place to the right, several things can happen:
  #   - The max num is still in the window:
  #   - The max num is shifted out of the window,
  #     and the new max is either the new num or 
  #     one of the numbers in the original window
  # Thus we need a data structure to keep track of the max for a window, 
  # followed by the elements only in descending order AFTER the max.
  # 
  # Whenever we encounter a new element, we keep popping elements from 
  # the end of the collection until we encounter an element bigger than it,
  # then we insert it after. 
  # (If the new element is the new max, all elements will be popped, and
  # the new max will become the new head of the collection.)

  maxes_i = []  # collection, stores the INDEX instead of actual element
  (0 ... k).each do |i|
    maxes_i.pop while !maxes_i.empty? and nums[maxes_i.last] < nums[i]
    maxes_i << i
  end
  
  result = [ nums[maxes_i.first] ]
  
  (k ... nums.length).each do |i|
    # Remove the index of the element at the front (i-k), if it is in maxes_i
    # The optimization is based on the fact that the elements (i.e. index)
    # in maxes_i are INCREASING
    maxes_i.each_with_index do |val, j|
      break if val > (i - k)
      if val == (i - k)
        maxes_i.delete_at(j)
        break
      end
    end

    maxes_i.pop while !maxes_i.empty? and nums[maxes_i.last] < nums[i]
    maxes_i << i
    result << nums[maxes_i.first]
  end
  
  return result
end

