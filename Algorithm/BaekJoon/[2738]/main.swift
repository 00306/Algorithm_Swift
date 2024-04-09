//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 4/9/24.
//

let NM = readLine()!.split(separator: " ").map { Int($0)! }
var arr = [[Int]]()
var answer = ""

for _ in 0..<2*NM[0] {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    arr.append(input)
}


for i in 0..<NM[0] {
    for j in 0..<NM[1] {
        arr[i][j] += arr[i+NM[0]][j]
        print(arr[i][j], terminator: " ")
    }
    print("\n", terminator: "")
}
