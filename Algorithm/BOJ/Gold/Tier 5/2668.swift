//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 4/8/25.
//

let N = Int(readLine()!)!

var numbers = Array(repeating: 0, count: N+1)
var visited = Array(repeating: false, count: N+1)
var result: Set<Int> = []

for i in 1...N {
    let number = Int(readLine()!)!
    numbers[i] = number
}

func findLongestNumberSet(index: Int, indexSet: Set<Int>, valueSet: Set<Int>) -> Set<Int> {
    let nextIndex = numbers[index]
    
    var newIndexSet = indexSet
    newIndexSet.insert(index)
    
    var newValueSet = valueSet
    newValueSet.insert(nextIndex)
    
    if indexSet.contains(nextIndex) {
        if newIndexSet == newValueSet { return newValueSet }
        else { return [] }
    }
    
    var resultSet: Set<Int> = []
    
    resultSet = resultSet.union(findLongestNumberSet(index: nextIndex, indexSet: newIndexSet, valueSet: newValueSet))
    
    
    return resultSet
}


for i in 1...N {
    result = result.union(findLongestNumberSet(index: i, indexSet: [], valueSet: []))
}


print(result.count)
result.sorted().forEach { print($0) }
