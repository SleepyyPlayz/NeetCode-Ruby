# @param {Integer[]} height
# @return {Integer}
def max_area(height)
  # volume of water formula for 2 elements A and B:
  #   min(A, B) * dist(A, B)
  #   min(A, B) * [max(A_index, B_index) - min(A_index, B_index)]
  # Assuming A comes before B:
  #   min(A, B) * (B_index - A_index)

  ptr_l = 0
  ptr_r = height.length - 1

  curr_max = [ height[ptr_l], height[ptr_r] ].min * (ptr_r - ptr_l)

  while ptr_l < ptr_r do
    vol = [ height[ptr_l], height[ptr_r] ].min * (ptr_r - ptr_l)

    curr_max = vol if vol > curr_max

    # change the shorter of the two current lines
    if height[ptr_l] < height[ptr_r] then
      ptr_l += 1
    else
      ptr_r -= 1
    end
  end

  return curr_max

end
