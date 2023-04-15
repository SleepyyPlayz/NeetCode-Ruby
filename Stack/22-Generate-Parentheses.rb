# @param {Integer} n
# @return {String[]}
def generate_parenthesis(n)
  # We can define a recursive helper function to help us generate.
  result = []
  gen_sequence(result, [], 0, 0, n)  # result is passed "by reference"
  return result
end

# @param {String[]} result
# @param {String[]} seq (current sequence of parentheses)
# @param {Integer} num_left (# of left parentheses in seq)
# @param {Integer} num_right (# of right parentheses in seq)
# @param {Integer} n
# return {Void}
def gen_sequence(result, seq, num_left, num_right, n)
  # sequence is FULL, add this to result
  if seq.length == 2 * n then
    result << seq.join
    return
  end

  # Recursive case 1: adding a left parenthesis
  if num_left < n then
    seq << "("
    gen_sequence(result, seq, num_left + 1, num_right, n)
    seq.pop
  end

  # Recursive case 2: adding a right parenthesis
  if num_right < num_left then
    seq << ")"
    gen_sequence(result, seq, num_left, num_right + 1, n)
    seq.pop
  end
end
