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
    func reverseList(_ head: ListNode?) -> ListNode? {
        if head == nil { return head }
        var currentNode = head
        var previousNode: ListNode? = nil
        var nextNode = currentNode?.next
        
        while currentNode != nil {
            nextNode = currentNode?.next
            currentNode?.next = previousNode
            previousNode = currentNode
            currentNode = nextNode
        }
        
        
        return previousNode
    }
}
