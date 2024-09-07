//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 10/10/24.
//


class ListNode {
    var val: Int
    var next: ListNode?
    init() { self.val = 0; self.next = nil; }
    init(_ val: Int) { self.val = val; self.next = nil; }
    init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
    
}

class Solution {
    func middleNode(_ head: ListNode?) -> ListNode? {
        var slowNode = head
        var fastNode = head
        
        while let _ = fastNode?.next {
            slowNode = slowNode?.next
            fastNode = fastNode?.next?.next
        }
        
        return slowNode
    }
}

