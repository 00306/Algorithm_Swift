//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 10/16/24.
//

class RandomizedSet {
    var items = Set<Int>()
    
    func insert(_ val: Int) -> Bool {
        if items.contains(val) { return false }
        items.insert(val)
        return true
    }
    
    func remove(_ val: Int) -> Bool {
        if !items.contains(val) { return false }
        items.remove(val)
        return true
    }
    
    func getRandom() -> Int {
        return items.randomElement()!
    }
}
