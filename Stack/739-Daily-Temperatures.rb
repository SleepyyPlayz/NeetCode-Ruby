# @param {Integer[]} temperatures
# @return {Integer[]}
def daily_temperatures(temperatures)
  # We use a stack to keep track of elements in the array that are
  # still looking for a "partner" (temps that are higher than it).
  # (This stack will only contain elements in descending order.)
  #
  # And whenever we encounter a new temperature, we start popping the
  # stack if this temperature is the partner of any in the stack.

  looking_i = []  # storing INDEXES for easy calculation of answers
  result = Array.new(temperatures.length, 0)  # result array, default 0

  temperatures.each_with_index do |temp, index|
    # see if this temp is the partner of any in the stack
    while looking_i.length > 0 && temperatures[looking_i.last] < temp do
      result[looking_i.last] = index - looking_i.last
      looking_i.pop
    end

    looking_i << index  # this temp itself then starts looking for a partner
  end

  return result
  
end

