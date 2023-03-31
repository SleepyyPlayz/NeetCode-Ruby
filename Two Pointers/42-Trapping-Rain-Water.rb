# @param {Integer[]} height
# @return {Integer}
def trap(height)
  # Exception handing, height has no elements:
  return 0 if height.length == 0

  # Intuition: A puddle is a "concavity" within the array
  # The spaces that are NOT holding water are the left side spaces that are non decreasing,
  # and the right-side spaces that are non-increasing.
  # The two sides are divided by the TALLEST bar.

  # Helper variables:
  h_sum = height.sum  # sum of the black bars
  h_max = height.max  # tallest black bar
  h_square = h_max * height.length  # volume of the rectangle that contains the tallest bar
  
  # First we calculate the "left-side empty space", this is obtained by
  # calculating the sum according to the tallest bar so far, from left to right,
  # then subtract this sum from h_square
  curr_max = height[0]
  curr_sum = 0
  height.each do |h|
    curr_max = h if h > curr_max  # found a new tallest bar
    curr_sum += curr_max
  end
  left_side_space = h_square - curr_sum

  # Then we calculate the "right-side empty space", this is obtained by
  # calculating the sum according to the tallest bar so far, from RIGHT to LEFT,
  # then subtract this sum from h_square
  reversed_height = height.reverse  # flip the height array, then use the same method
  curr_max = reversed_height[0]
  curr_sum = 0
  reversed_height.each do |h|
    curr_max = h if h > curr_max  # found a new tallest bar
    curr_sum += curr_max
  end
  right_side_space = h_square - curr_sum

  # Final result
  return h_square - (h_sum + left_side_space + right_side_space)

end
