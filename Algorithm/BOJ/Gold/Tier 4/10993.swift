//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 3/21/25.
//

func calculateCurrentSize(n: Int) -> (Int, Int) {
    var width = 5
    var height = 3
    var currentLevel = 2
    
    while currentLevel < n {
        width = width * 2 + 3
        height = height * 2 + 1
        currentLevel += 1
    }
    
    return (width, height)
}

let n = Int(readLine()!)!
let (width, height) = calculateCurrentSize(n: n)
var triangle = Array(repeating: Array(repeating: " ", count: width + 1), count: height)
var result = ""

func drawTriangle(n: Int, x: Int, y: Int, width: Int, height: Int) {
    if n == 2 {
        triangle[y][x] = "*"
        triangle[y][x+1] = "*"
        triangle[y][x+2] = "*"
        triangle[y][x+3] = "*"
        triangle[y][x+4] = "*"
        
        triangle[y+1][x+1] = "*"
        triangle[y+1][x+2] = "*"
        triangle[y+1][x+3] = "*"
        
        triangle[y+2][x+2] = "*"
        return
    }
    
    let nextWidth = (width - 3) / 2
    let nextHeight = (height - 1) / 2
    
    if n % 2 == 0 {
        for j in x..<x + width {
            triangle[y][j] = "*"
        }
        
        for i in 1..<height {
            triangle[y+i][x+i] = "*"
            triangle[y+i][x+width-i-1] = "*"
        }
        
        drawTriangle(n: n-1, x: (x + width / 2), y: y+1, width: nextWidth, height: nextHeight)
        
    } else {
        for i in 0..<height - 1 {
            triangle[y+i][x+i] = "*"
            triangle[y+i][x-i] = "*"
        }
        
        for j in x - (width / 2)..<x + (width / 2) + 1 {
            triangle[y + height - 1][j] = "*"
        }
        
        drawTriangle(n: n-1, x: x - width / 4 + 1, y: (y + height / 2), width: nextWidth, height: nextHeight)
    }
}




if n == 1 { print("* ") } else {
    if n % 2 == 0 {
        drawTriangle(n: n, x: 0, y: 0, width: width, height: height)
        
        for i in 0..<height {
            for j in 0..<width - i {
                result += triangle[i][j]
            }
            result += " \n"
        }
        
    } else {
        drawTriangle(n: n, x: width / 2, y: 0, width: width, height: height)
        
        for i in 0..<height {
            for j in 0..<width / 2 + i + 1 {
                result += triangle[i][j]
            }
            result += " \n"
        }
    }
}

    
print(result)
