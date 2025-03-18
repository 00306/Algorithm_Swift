//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 9/12/24.
//

let n = Int(readLine()!)!
var map: [[Int]] = []
var result = ""

for _ in 0..<n {
    let line = readLine()!.map { Int(String($0))! }
    map.append(line)
}


func explore(x: Int, y: Int, n: Int) -> String {
    let number = map[y][x]
    
    for i in y..<y+n {
        for j in x..<x+n {
            if map[i][j] != number {
                return "(" + explore(x: x, y: y, n: n/2) + explore(x: x+(n/2), y: y, n: n/2) + 
                explore(x: x, y: y+(n/2), n: n/2) + explore(x: x+(n/2), y: y+(n/2), n: n/2) + ")"
            }
        }
    }
    
    return String(number)
}


print(explore(x: 0, y: 0, n: n))

