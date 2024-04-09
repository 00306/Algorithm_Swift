//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 4/9/24.
//

var paper: [[Bool]] = Array(repeating: Array(repeating: false, count: 100), count: 100)

let n = Int(readLine()!)!

for _ in 0..<n {
    let coordinate = readLine()!.split(separator: " ").map { Int($0)! }
    let x = coordinate[0]
    let y = coordinate[1]
    
    for i in y..<y+10 {
        for j in x..<x+10 {
            paper[i][j] = true
        }
    }
}

print(paper.flatMap { $0 }.filter { $0 }.count)


