# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} head
# @return {ListNode}
def reverse_list(head)
  return head if head.nil?

  curr = head
  prev = nil

  until curr.nil? do
    # just flip the direction that each node points to its next one
    t = curr.next
    curr.next = prev

    prev = curr
    curr = t
  end

  return prev
end
