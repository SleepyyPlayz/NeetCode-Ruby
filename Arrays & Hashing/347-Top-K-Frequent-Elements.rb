# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer[]}
def top_k_frequent(nums, k)
  # We use a hash table to count the occurrences of elements in nums
  # after which we sort the hash table according to its values in
  # descending order, then extract the first k keys

  count = Hash.new
  
  # counting the numbers
  nums.each do |num| 
    if not count.has_key?(num) then
      count[num] = 1  # num's first occurrence
    else
      count[num] += 1
    end
  end

  # array of numbers ordered according to number of occurrences, descending
  most_frequent_nums = count.sort_by {|k,v| v} .reverse .to_h .keys

  return most_frequent_nums.first(k)

end
