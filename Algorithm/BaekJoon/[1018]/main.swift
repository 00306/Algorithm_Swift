//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 4/21/24.
//

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0]
let m = input[1]

var square: [[String]] = []

var answer = Int.max

for _ in 0..<n {
    square.append(readLine()!.map { String($0) })
}

for i in 0..<n-7 {
    for j in 0..<m-7 {
        var count = 0
        var bCount = 0
        var wCount = 0
        
        for k in 0..<8 {
            for m in 0..<8 {
                    if (k+m) % 2 == 0, square[i+k][j+m] == "W" {
                        bCount+=1
                    }
                    
                    if (k+m) % 2 == 1, square[i+k][j+m] == "B" {
                        bCount+=1
                    }
                    
                    if (k+m) % 2 == 0, square[i+k][j+m] == "B" {
                        wCount+=1
                    }
                    if (k+m) % 2 == 1, square[i+k][j+m] == "W" {
                        wCount+=1
                    }
            }
            
        }
        
        answer = min(answer, min(bCount, wCount))
    }
}

print(answer)
