//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 6/1/24.
//

var numArray = [Int]()
var memo: [[[Int]]] = Array(repeating: Array(repeating: Array(repeating: 0, count: 51), count: 51), count: 51)
var result = ""

while true {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    if input == [-1, -1, -1] { break }
    result += "w(\(input[0]), \(input[1]), \(input[2])) = \(w(input[0], input[1], input[2]))\n"
}
print(result)


func w(_ a: Int, _ b: Int, _ c: Int) -> Int {
    func memoization(_ a: Int, _ b: Int, _ c: Int) -> Int {
        if memo[a][b][c] != 0 {
            return memo[a][b][c]
        } else {
            let result = w(a, b, c)
            memo[a][b][c] = result
            return result
        }
    }
    
    if a <= 0 || b <= 0 || c <= 0 {
        return 1
    }
    
    if a > 20 || b > 20 || c > 20 { return memoization(20, 20, 20) }
    if a < b, b < c { return memoization(a, b, c-1) + memoization(a, b-1, c-1) - memoization(a, b-1, c) }
    
    return memoization(a-1, b, c) + memoization(a-1, b-1, c) + memoization(a-1, b, c-1) - memoization(a-1, b-1, c-1)
}

