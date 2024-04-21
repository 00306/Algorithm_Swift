//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 4/21/24.
//



// 748ms 왜!!!
let n = Int(readLine()!)!

var answer = 0

for i in 0..<n {
    var sum = i
    let arr = String(i).map { $0 }
    
    for num in arr {
        sum += Int(String(num))!
    }
    
    if sum == n {
        answer = i
        break
    }
}

print(answer)


// 8ms

//let n = Int(readLine()!)!
//var answer = 0
//
//for i in max(1, n - 54)...n {
//    if n == i + String(i).reduce(0, { $0 + Int(String($1))! }) {
//        answer = i
//        break
//    }
//}
//
//print(answer)
