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
    func partition(_ head: ListNode?, _ x: Int) -> ListNode? {
        let lessHead = ListNode()
        let greaterHead = ListNode()
        
        var lessList = lessHead
        var greaterList = greaterHead
        var currentNode = head
        
        while currentNode != nil {
            if currentNode!.val >= x {
                greaterList.next = currentNode
                greaterList = greaterList.next!
            } else {
                lessList.next = currentNode
                lessList = lessList.next!
            }
            
            currentNode = currentNode?.next
        }
        
        greaterList.next = nil
        lessList.next = greaterHead.next
        
        return lessHead.next
    }
}
