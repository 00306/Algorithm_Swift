//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 9/12/24.
//

let n = Int(readLine()!)!
var map: [[Int]] = []

var countDictionary = [
    -1: 0,
     0: 0,
     1: 0,
]

for _ in 0..<n {
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    map.append(line)
}

func isUniform(x: Int, y: Int, n: Int) -> Bool {
    let number = map[y][x]
    for i in y..<y+n {
        for j in x..<x+n {
            if map[i][j] != number {
                return false
            }
        }
    }
    return true
}

func explore(x: Int, y: Int, n: Int) {
    if n == 1 || isUniform(x: x, y: y, n: n) {
        countDictionary[map[y][x]]! += 1
        return
    }
    
    
    for i in 0..<3 {
        for j in 0..<3 {
            explore(x: x + j * (n/3), y: y + i * (n/3), n: n/3)
        }
    }
}


explore(x: 0, y: 0, n: n)
print(countDictionary[-1]!, countDictionary[0]!, countDictionary[1]!, separator: "\n")
