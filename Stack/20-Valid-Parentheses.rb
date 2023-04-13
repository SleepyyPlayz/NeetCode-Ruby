# @param {String} s
# @return {Boolean}
def is_valid(s)
  stack = []
  counterpart = {")" => "(", "]" => "[", "}" => "{"}

  s.each_char do |c|
    case c
      when "(", "[", "{"
        stack << c
      when ")", "]", "}"
        return false if stack.empty?

        c_end = stack.pop
        return false if c_end != counterpart[c]
    end
  end

  return false if not stack.empty?
  return true
end

