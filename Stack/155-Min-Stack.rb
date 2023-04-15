class MinStack
  # Since this is a STACK, the data is mono-directional,
  # thus apart from the element itself, we can just 
  # keep track of the minimum UP TO THIS ELEMENT, for 
  # every element in the stack.
  # e.g.
  # Stack: [5, 3, 4, 2, 7]
  # Mins:  [5, 3, 3, 2, 2]

  def initialize()
    @stack = []  # stack ifself
    @mins = []   # minimum of stack up to (including) the element
  end

=begin
    :type val: Integer
    :rtype: Void
=end
  def push(val)
    @stack << val
    if @mins.empty? then
      @mins << val
    else
      if val < @mins.last then
        # new element is new minimum so far
        @mins << val
      else
        # new element is not new minimum so far
        @mins << @mins.last
      end
    end
  end

=begin
    :rtype: Void
=end
  def pop()
    @stack.pop
    @mins.pop
  end

=begin
    :rtype: Integer
=end
  def top()
    return @stack.last
  end

=begin
    :rtype: Integer
=end
  def get_min()
    return @mins.last
  end

end

