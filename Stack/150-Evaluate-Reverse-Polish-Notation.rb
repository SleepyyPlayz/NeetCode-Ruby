# @param {String[]} tokens
# @return {Integer}
def eval_rpn(tokens)
  # This is quite simple, we record numbers in a stack,
  # and whenever we encounter an operator, pop two numbers
  # from the stack, do the operation, and insert the result
  # of the operation back in the stack.
  
  num_stack = []  # numbers and results of 
  
  tokens.each do |token|
    case token
    when "+"
      num_stack << (num_stack.pop + num_stack.pop)  # commutative
    when "-"
      subtrahend = num_stack.pop
      minuend = num_stack.pop
      num_stack << (minuend - subtrahend)
    when "*"
      num_stack << (num_stack.pop * num_stack.pop)  # commutative
    when "/"
      divisor = num_stack.pop
      dividend = num_stack.pop
      num_stack << (dividend.to_f / divisor).to_i  # truncate TOWARD 0
    else  # number
      num_stack << token.to_i
    end
  end

  # the number remaining in the stack is the result
  return num_stack.first
end
