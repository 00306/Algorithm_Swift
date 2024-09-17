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
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        let resultHead: ListNode? = ListNode(0)
        var resultNode = resultHead
        
        var firstNode = list1
        var secondNode = list2
        
        while firstNode != nil && secondNode != nil {
            guard let firstValue = firstNode?.val else { continue }
            guard let secondValue = secondNode?.val else { continue }
            
            if firstValue >= secondValue {
                resultNode?.next = secondNode
                secondNode = secondNode?.next
            }
            else {
                resultNode?.next = firstNode
                firstNode = firstNode?.next
            }
            
            resultNode = resultNode?.next
        }
        
        resultNode?.next = firstNode == nil ? secondNode : firstNode
        
        return resultHead?.next
    }
}
