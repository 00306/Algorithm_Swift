//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 10/21/24.
//

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}


class Solution {
    func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
        var firstNode = headA
        var secondNode = headB
        
        while firstNode !== secondNode {
            firstNode = (firstNode == nil) ? headB : firstNode?.next
            secondNode = (secondNode == nil) ? headA : secondNode?.next
        }
        
        return firstNode
        
        
    }
}
