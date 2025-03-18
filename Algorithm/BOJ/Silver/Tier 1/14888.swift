//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 5/29/24.
//

let n = Int(readLine()!)!
let numbers = readLine()!.split(separator: " ").map { Int($0)! }
let operators = readLine()!.split(separator: " ").map { Int($0)! }
let operatorCount = operators.reduce(0, +)
var operatorTuple: [(String, Int)] = []

operatorTuple.append(contentsOf: [("+", operators[0]), ("-", operators[1]), ("*", operators[2]), ("/", operators[3])])
var minValue = Int.max
var maxValue = Int.min

dfs(n: 1, result: numbers[0])
print(maxValue)
print(minValue)

func dfs(n: Int, result: Int) {
    if n == numbers.count {
        minValue = min(minValue, result)
        maxValue = max(maxValue, result)
        return
    }
    
    for i in 0..<operators.count where operatorTuple[i].1 != 0 {
        operatorTuple[i].1 -= 1
        switch operatorTuple[i].0 {
            case "+":
                dfs(n: n+1, result: result + numbers[n])
            case "-":
                dfs(n: n+1, result: result - numbers[n])
            case "*":
                dfs(n: n+1, result: result * numbers[n])
            case "/":
                dfs(n: n+1, result: result / numbers[n])
                
            default: continue
        }
        operatorTuple[i].1 += 1
    }
        
}
