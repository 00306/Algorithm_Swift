//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 3/21/25.
//

func recursion(k: Int, n: Int, length: Int) -> String {
    if k == 0 {
        return n == 1 ? "m" : "o"
    }
    
    let prevLength = (length - (k+3)) / 2
    
    if n <= prevLength {
        return recursion(k: k-1, n: n, length: prevLength)
    } else if n <= prevLength + k + 3 {
        return n == prevLength + 1 ? "m" : "o"
    } else {
        return recursion(k: k-1, n: n - (prevLength + k + 3), length: prevLength)
    }
    
}

let n = Int(readLine()!)!
var k = 0
var length = 3
while length < n {
    k += 1
    length = (length * 2) + k + 3
}


print(recursion(k: k, n: n, length: length))
