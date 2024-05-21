//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 5/20/24.
//

let n = Int(String(readLine()!))!
var star = ""

for i in 0..<n {
    for j in 0..<n {
        recursion(n: n, i: i, j: j, string: &star)
    }
    star += "\n"
}

func recursion(n: Int, i: Int, j: Int, string: inout String) {
    // 베이스부터
    if n == 1 { return }
    if (j % 3 == 1 && i % 3 == 1) || ((j % n) >= n / 3 && (j % n) < n * 2 / 3 && (i % n) >= n / 3 && (i % n) < n * 2 / 3) {
        string += " "
    } else {
        if n == 3 {
            string += "*"
        } else {    
            recursion(n: n / 3, i: i, j: j, string: &string)
        }
    }
}

print(star)
