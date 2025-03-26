//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 3/26/25.
//

let s = readLine()!
let t = readLine()!.map { String($0) }
var flipped = false
var left = 0
var right = t.count - 1

while (right - left) >= s.count {
    let word = flipped ? t[left] : t[right]
    
    if flipped { left += 1 }
    else { right -= 1 }
    
    if word == "B" {
        flipped = !flipped
    }
}

let result = flipped ? t[left...right].reversed().joined(separator: "") : t[left...right].joined(separator: "")

print(result == s ? 1 : 0)


