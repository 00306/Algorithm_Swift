//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 9/11/24.
//

let n = Int(readLine()!)!
var map: [[Int]] = []
var whiteCount = 0
var blueCount = 0

for _ in 0..<n {
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    map.append(line)
}

func explore(x: Int, y: Int, n: Int) {
    let color = map[y][x]
    
    for i in y..<y+n {
        for j in x..<x+n {
            if map[i][j] != color {
                explore(x: x, y: y, n: n/2)
                explore(x: x + n/2, y: y, n: n/2)
                explore(x: x, y: y + n/2, n: n/2)
                explore(x: x + n/2, y: y + n/2, n: n/2)
                return
            }
        }
    }
    
    if color == 0 { whiteCount += 1 }
    else { blueCount += 1 }
}

explore(x: 0, y: 0, n: n)

print(whiteCount, blueCount, separator: "\n")
