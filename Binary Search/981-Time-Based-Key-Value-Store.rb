class TimeMap
  # Data is stored in a hash, with each value of a key being
  # an array of timestamp-value pairs
  def initialize()
    @main_hash = Hash.new
  end


=begin
  :type key: String
  :type value: String
  :type timestamp: Integer
  :rtype: Void
=end
  def set(key, value, timestamp)
    if @main_hash.has_key? key
      @main_hash[key] << {:time => timestamp, :val => value}
    else
      @main_hash[key] = [ {:time => timestamp, :val => value} ]
    end
  end


=begin
  :type key: String
  :type timestamp: Integer
  :rtype: String
=end
  def get(key, timestamp)
    return "" if not @main_hash.has_key? key

    key_arr = @main_hash[key]

    # edge cases, first and last
    return "" if timestamp < key_arr.first[:time]
    return key_arr.last[:val] if key_arr.last[:time] <= timestamp

    # now search for appropriate timestamp inside arr
    l = 0
    r = key_arr.length
    
    while l < r do
      mid = (l + r) / 2
      return key_arr[mid][:val] if key_arr[mid][:time] == timestamp
      
      if key_arr[mid][:time] <= timestamp then
        l = mid + 1
      else
        r = mid
      end
    end

    # precise timestamp not found, fall back to the timestamp just before it
    return key_arr[l - 1][:val]
  end

end

# Your TimeMap object will be instantiated and called as such:
# obj = TimeMap.new()
# obj.set(key, value, timestamp)
# param_2 = obj.get(key, timestamp)
