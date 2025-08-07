//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 8/7/25.
//

func getAllOperatorCombination(n: Int) -> [[String]] {
    let operators = ["+", "-", " "].sorted()
    var combinations: [[String]] = []
    
    func getCombination(n: Int, sub: [String]) {
        if sub.count == n-1 {
            combinations.append(sub)
            return
        }
        
        for op in operators {
            getCombination(n: n, sub: sub + [op])
        }
        
    }
    
    getCombination(n: n, sub: [])
    
    return combinations
    
}

func countAllValidEquationCases(n: Int) -> String {
    let combinations = getAllOperatorCombination(n: n)
    var result = ""
    
    for combination in combinations {
        var formula: [String] = ["1"]
        var sign = 1
        var buffer = ""
        var total = 0
        
        
        for i in 2...n {
            formula.append(combination[i-2])
            formula.append(String(i))
            
        }
        
        for char in formula {
            if char == " " { continue }
            else if char == "+" {
                total += sign * Int(buffer)!
                sign = 1
                buffer = ""
                
            } else if char == "-" {
                total += sign * Int(buffer)!
                sign = -1
                buffer = ""
                
            } else { buffer += char }
        }
        
        total += sign * Int(buffer)!
        
        if total == 0 {
            result += "\(formula.joined())\n"
        }
        
        
    }
    
    result += "\n"
    
    return result
}

let T = Int(readLine()!)!
var result = ""

for _ in 0..<T {
    let N = Int(readLine()!)!
    
    result += "\(countAllValidEquationCases(n: N))"
}

print(result)
