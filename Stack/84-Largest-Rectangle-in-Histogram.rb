# @param {Integer[]} heights
# @return {Integer}
def largest_rectangle_area(heights)
  max_area = 0
  stack = []  # a stack recording [index, height]
  
  heights.each_with_index do |h, i|
    start_i = i
    
    while !stack.empty? && stack[-1][1] > h do
      s_index, s_height = stack.pop
      max_area = [max_area, s_height * (i - s_index)].max

      start_i = s_index
    end
    
    stack << [start_i, h]
  end

  stack.each do |index, height|
    max_area = [max_area, height * (heights.length - index)].max
  end

  return max_area
end
