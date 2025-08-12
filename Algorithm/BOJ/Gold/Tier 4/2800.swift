//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 8/12/25.
//

let formula = readLine()!.map { String($0) }
var parentheses: [(Int, Int)] = []
var stack: [Int] = []
var result = ""


for (index, char) in formula.enumerated() {
    if char == ")" {
        
        while let element = stack.popLast() {
            if formula[element] == "(" {
                parentheses.append((element, index))
                break
            }
        }
    } else { stack.append(index) }
}

func getSubset(of array: [(Int, Int)]) -> [[(Int, Int)]] {
    var subset: [[(Int, Int)]] = []
    
    func dfs(startIndex: Int, sub: [(Int, Int)]) {
        if startIndex != 0 { subset.append(sub) }
        
        for i in startIndex..<array.count {
            dfs(startIndex: i + 1, sub: sub + [array[i]])
        }
        
    }
    
    dfs(startIndex: 0, sub: [])
    
    
    return subset
}

let subset = getSubset(of: parentheses)
var newFormulas: Set<String> = []

for parentheses in subset {
    var newFormula: [String] = []
    var skipIndex: [Bool] = Array(repeating: false, count: formula.count)
    
    parentheses.forEach {
        skipIndex[$0.0] = true
        skipIndex[$0.1] = true
    }
    
    for i in 0..<formula.count {
        if skipIndex[i] { continue }
        
        newFormula.append(formula[i])
    }
    
    newFormulas.update(with: newFormula.joined())
}

for newFormula in newFormulas.sorted() {
    print(newFormula)
}
