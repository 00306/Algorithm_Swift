//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 5/31/24.
//

let input = Int(readLine()!)!
var repeatCount = 0


repeatFibonacci(input)

print(recursionFibonacci(input), repeatCount)



func recursionFibonacci(_ n: Int) -> Int {
    if n <= 1 {
        return n
    }
    
    return recursionFibonacci(n - 2) + recursionFibonacci(n - 1)
}

func repeatFibonacci(_ n: Int) -> Int {
    if n == 0 { return 0 }
    
    var array = [Int](repeating: 0, count: n+1)
    if n > 1 {
        array[2] = 1
    }
    
    for i in 3...n {
        array[i] = array[i - 2] + array[i - 1]
        repeatCount += 1
    }
    
    return array[n]
}
