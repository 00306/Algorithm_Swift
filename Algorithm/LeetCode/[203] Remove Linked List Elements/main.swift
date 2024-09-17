//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 10/21/24.
//

class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
        let resultHead: ListNode? = ListNode(0)
        var resultNode = resultHead
        resultNode?.next = head
        var previousNode = resultHead
        
        while resultNode != nil {
            guard let value = resultNode?.val else { continue }
            
            if value == val { previousNode?.next = resultNode?.next }
            else { previousNode = resultNode }
            
            resultNode = resultNode?.next
        }
        
        return resultHead?.next
    }
}
