//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 10/20/24.
//

class MinStack {
    private var elements: [Int] = []
    private var minArray: [Int] = []
    
    func push(_ val: Int) {
        elements.append(val)
        
        if minArray.isEmpty { minArray.append(val) }
        else if getMin() >= val { minArray.append(val) }
    }
    
    func pop() {
        let top = elements.removeLast()
        if !minArray.isEmpty, top == getMin() { minArray.removeLast() }
        
    }
    
    func top() -> Int { elements.last! }
    
    func getMin() -> Int { minArray.last! }
}

/**
 * Your MinStack object will be instantiated and called as such:
 * let obj = MinStack()
 * obj.push(val)
 * obj.pop()
 * let ret_3: Int = obj.top()
 * let ret_4: Int = obj.getMin()
 */
