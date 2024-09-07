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
    
    func reorderList(_ head: ListNode?) {
        var slowNode = head
        var fastNode = head
        
        while fastNode?.next != nil && fastNode?.next?.next != nil {
            slowNode = slowNode?.next
            fastNode = fastNode?.next?.next
        }
        
        var prev: ListNode?
        var curr = slowNode?.next
        slowNode?.next = nil
        
        while curr != nil {
            let nextNode = curr?.next
            curr?.next = prev
            prev = curr
            curr = nextNode
        }
        
        var first = head
        var second = prev
        
        while second != nil {
            let firstNode = first?.next
            let secondNode = second?.next
            
            first?.next = second
            second?.next = firstNode
            
            first = firstNode
            second = secondNode
        }
    }
    
    
}
