# @param {Integer} target
# @param {Integer[]} position
# @param {Integer[]} speed
# @return {Integer}
def car_fleet(target, position, speed)
  # First we group the data into an array of "tuples" for ease of processing
  data = position.zip(speed)

  # Then sort according to position, nearest to the target first
  data.sort_by! { |tup| -tup[0] }

  # The calculate how much time it takes each of the cars to arrive
  data.map! { |tup| (target - tup[0]).to_f / tup[1] }

  # Go through each car in sequence, if a car further to the destination would
  # arrive sooner than the car before it, then they are of the same fleet
  num_fleets = 0
  curr_max = -1

  data.each do |time|
    if time > curr_max then
      num_fleets += 1
      curr_max = time
    end
  end

  return num_fleets
end
