//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 10/16/24.
//

class Solution {
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        var numberDictionary: [Int: [Int]] = [:]
        var result: [Int] = []
        for (index, num) in numbers.enumerated() {
            numberDictionary[num, default: []].append(index+1)
        }
        
        for num in numbers {
            if let index2 = numberDictionary[target - num]?.first {
                result.append(contentsOf: [index2, numberDictionary[num]!.last!])
                numberDictionary[target-num]!.removeLast()
                break
            }
        }
        return result.sorted()
    }
}
