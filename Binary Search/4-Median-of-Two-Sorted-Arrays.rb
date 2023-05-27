# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @return {Float}
def find_median_sorted_arrays(nums1, nums2)
  n1 = nums1.length
  n2 = nums2.length
  
  # ensure that n1 <= n2
  return find_median_sorted_arrays(nums2, nums1) if n1 > n2

  l = 0
  r = n1
  while l <= r do
    mid1 = (l + r) / 2
    mid2 = (n1 + n2 + 1) / 2 - mid1
    
    max_left1 = -Float::INFINITY
    max_left1 = nums1[mid1 - 1] if mid1 != 0
    min_right1 = Float::INFINITY
    min_right1 = nums1[mid1] if mid1 != n1

    max_left2 = -Float::INFINITY
    max_left2 = nums2[mid2 - 1] if mid2 != 0
    min_right2 = Float::INFINITY
    min_right2 = nums2[mid2] if mid2 != n2

    if max_left1 <= min_right2 && max_left2 <= min_right1
      if (n1 + n2) % 2 == 0
        return ([max_left1, max_left2].max.to_f + [min_right1, min_right2].min.to_f) / 2
      else
        return [max_left1, max_left2].max.to_f
      end
    elsif max_left1 > min_right2
      r = mid1 - 1
    else
      l = mid1 + 1
    end
  end
  
  return -1
end
