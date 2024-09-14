//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 10/16/24.
//

class Solution {
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        var numberDictionary: [Int: Int] = [:]
        for num in nums { numberDictionary[num, default: 0] += 1 }
        let keyArray = numberDictionary.sorted(by: { num1, num2 in
            return num1.value >= num2.value
        })
        
        var result: [Int] = []
        
        for i in 0..<k {
            result.append(keyArray[i].key)
        }
        
        return result
    }
}
