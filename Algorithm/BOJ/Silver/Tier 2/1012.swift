//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 6/28/24.
//

let t = Int(readLine()!)!
var result = ""
var map = Array(repeating: Array(repeating: 0, count: 51), count: 51)
var count = 0


for _ in 0..<t {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let m = input[0]
    let n = input[1]
    let k = input[2]
    
    
    for _ in 0..<k {
        let coordinate = readLine()!.split(separator: " ").map { Int($0)! }
        map[coordinate[1]][coordinate[0]] = 1
    }
    
    func setWorm(x: Int, y: Int, k: Int) {
        if x > m || x < 0 || y > n || y < 0 || k == 0 || map[y][x] == 0 { return }
        map[y][x] = 0
        
        setWorm(x: x+1, y: y, k: k-1)
        setWorm(x: x-1, y: y, k: k-1)
        setWorm(x: x, y: y-1, k: k-1)
        setWorm(x: x, y: y+1, k: k-1)
    }
    
    for i in 0..<n {
        for j in 0..<m {
            if map[i][j] == 1 {
                setWorm(x: j, y: i, k: k)
                count += 1
            }
        }
    }
    
    result += "\(count)\n"
    count = 0
    map = Array(repeating: Array(repeating: 0, count: 51), count: 51)
    
}

print(result)


