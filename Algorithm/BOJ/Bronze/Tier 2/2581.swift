//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 4/16/24.
//

// MARK: 260ms
import Foundation

let startNum = Int(readLine()!)!
let endNum = Int(readLine()!)!
var primes: [Int] = []

(startNum...endNum).forEach { num1 in
    if (1...num1).filter { num1 % $0 == 0 }.count == 2 {
        primes.append(num1)
    }
}

if primes.isEmpty {
    print(-1)
} else {
    print(primes.reduce(0, +))
    print(primes.min()!)
}




// MARK: 백준 숏코딩 12ms
// 어떻게 이렇게 시간 차이가 많이 나는거지!!

//import Foundation
//let (M,N) = (Int(readLine()!)!,Int(readLine()!)!)
//let a = (M...N).filter {
//    if $0<4 {return $0==1 ? false : true}
//    for i in 2...Int(sqrt(Double($0))) { if ($0%i==0) {return false} }
//    return true
//}
//if a.isEmpty {print(-1)}
//else { print(a.reduce(0,+)); print(a[0])}
