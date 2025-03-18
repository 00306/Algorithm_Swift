//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 4/12/24.
//

let input = readLine()!.split(separator: " ")
let N = input[0].map { String($0) }
let B = input[1]

var dictionary: [String: Int] = [:]

var answer = 0


for i in 10...35 {
    let num = 55
    dictionary[String(UnicodeScalar(num+i)!)] = i
}


for i in 0..<N.count {
    let n = N.count - i - 1
    var num1 = 0
    var num2 = 1
    
    if Int(N[i]) == nil {
        num1 = dictionary[N[i]]!
    } else {
        num1 = Int(N[i])!
    }
    
    for _ in 0..<n {
        num2 *= Int(B)!
    }
    
    answer += num1 * num2
}

print(answer)
