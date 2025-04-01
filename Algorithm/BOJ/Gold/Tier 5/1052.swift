//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 4/1/25.
//

let nk = readLine()!.split(separator: " ").map { Int($0)! }
var n = nk[0]
let k = nk[1]
var currentLiter = 1
var result = 0
var remainings: [Int] = []

while n > 1 {
    let remain = n % 2
    if remain != 0 {
        remainings.append(remain * currentLiter)
    }
    
    n /= 2
    currentLiter *= 2
    
}

var index = 0

while remainings.count - index + 1 > k && index < remainings.count {
    if remainings.count - index == 1 {
        result += currentLiter - remainings[index]
        break
    }
    if index + 1 >= remainings.count { break }
    
    result += remainings[index + 1] - remainings[index]
    remainings[index + 1] *= 2
    index += 1

}

print(result)
