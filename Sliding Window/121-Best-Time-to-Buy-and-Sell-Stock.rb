# @param {Integer[]} prices
# @return {Integer}
def max_profit(prices)
  # We start by assuming that we are buying at index 0,
  # and as we iterate through the array, we calcucate and update
  # the max profit.
  # But if we encounter a price that is lower than our current buying price,
  # then we set that as the new buying point.

  ptr_buy = 0  # index of where we are buying the stock
  curr_max_profit = 0

  prices.each_with_index do |p, i|
    ptr_buy = i if p < prices[ptr_buy]  # update buying point if necessary

    # update max profit if necessary
    curr_max_profit = p - prices[ptr_buy] if p - prices[ptr_buy] > curr_max_profit
  end

  return curr_max_profit
end
