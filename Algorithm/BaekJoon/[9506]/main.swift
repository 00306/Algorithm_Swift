//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 4/15/24.
//
import Foundation

var arr: [Int] = []
var answer = ""

while true {
    arr.append(Int(readLine()!)!)
    if arr.last! == -1 {
        arr.removeLast()
        break
    }
}

for num in arr {
    let numSqrt = Int(sqrt(Double(num)))
    var measure: [Int] = []
    
    for i in 1...numSqrt {
        if num % i == 0 {
            measure.append(i)
            
            if num / i != i, num / i != num {
                measure.append(num / i)
            }
        }
    }
    var sum = measure.reduce(0, +)
    
    if sum == num {
        answer += "\(num) = "
        let string_arr = measure.sorted(by: <).map { String($0) }
        answer += "\(string_arr.joined(separator: " + "))\n"
        
    } else {
        answer += "\(num) is NOT perfect.\n"
    }
    
    measure = []
}

print(answer)
