# @param {Integer[]} piles
# @param {Integer} h
# @return {Integer}
def min_eating_speed(piles, h)
  # For this, we can use binary search to find the minimal 
  # eating speed required. 
  # First we need to determine the range in which we do our search:
  speed_max = piles.max  # eating at this rate guarantees success
  speed_min = 1
  
  l = speed_min
  r = speed_max + 1

  while l < r do  # stops when the two are equal
    mid = (l + r) / 2
    time = piles.map { |p| (p.to_f / mid).ceil } .sum  # total time it takes
    
    if time <= h then  # valid, speed can go lower
      r = mid
    else  # invalid, must increast min speed
      l = mid + 1
    end
  end

  return l
end
