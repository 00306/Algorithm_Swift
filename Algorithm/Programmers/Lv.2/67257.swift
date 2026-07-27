//
//  67257.swift
//  Algorithm
//
//  Created by 송지혁 on 7/27/26.
//

import Foundation

func permutation(elements: [String]) -> [[String]] {
    var result: [[String]] = []
    
    func dfs(current: [String]) {
        if current.count == elements.count {
            result.append(current)
            return
        }
        
        for i in 0..<elements.count {
            let element = elements[i]
            if current.contains(element) { continue }
            dfs(current: current + [element])
        }
    }
    
    dfs(current: [])
    
    return result
}

func parsing(string: String) -> [String] {
    let stringArray = string.map { String($0) }
    var subString = ""
    var result: [String] = []
    
    for char in stringArray {
        if char == "*" || char == "+" || char == "-" {
            result.append(subString)
            result.append(char)
            subString = ""
            continue
        }
        
        subString += char
    }
    
    if subString != "" {
        result.append(subString)
    }
    
    return result
}

func getMax(order: [String], expression: [String]) -> Int64 {
    var firstStack: [String] = expression
    var secondStack: [String] = []
    
    for op in order {
        var i = 0
        
        while i < firstStack.count {
            let element = firstStack[i]
            
            if element == op {
                let firstNumber = Int(secondStack.popLast()!)!
                let secondNumber = Int(firstStack[i+1])!
                
                if op == "+" {
                    secondStack.append(String(firstNumber + secondNumber))
                } else if op == "-" {
                    secondStack.append(String(firstNumber - secondNumber))
                } else if op == "*" {
                    secondStack.append(String(firstNumber * secondNumber))
                }
                
                i += 2
            } else {
                secondStack.append(element)
                i += 1
            }
        }
        
        firstStack = secondStack
        secondStack.removeAll()
    }
    
    return abs(Int64(firstStack.first!)!)
}


func solution(_ expression: String) -> Int64 {
    let operatorOrders = permutation(elements: ["*", "+", "-"])
    let expressionArray = parsing(string: expression)
    
    var result: Int64 = 0
    
    for order in operatorOrders {
        let maxValue = getMax(order: order, expression: expressionArray)
        result = max(result, maxValue)
    }
    
    return result
}
