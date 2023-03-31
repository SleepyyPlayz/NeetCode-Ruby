# @param {Integer[]} numbers
# @param {Integer} target
# @return {Integer[]}
def two_sum(numbers, target)
    # Since the array is sorted, we can start examining from the ends
    # of the array:

    front_ptr = 0
    back_ptr = numbers.length - 1
    
    while front_ptr < back_ptr do
      if numbers[front_ptr] + numbers[back_ptr] == target then
        return [front_ptr + 1, back_ptr + 1]
      elsif numbers[front_ptr] + numbers[back_ptr] < target then
        # we need a bigger number, move the left pointer up
        front_ptr += 1
      else
        # we need a smaller number, move the right pointer down
        back_ptr -= 1
      end
    end

end
