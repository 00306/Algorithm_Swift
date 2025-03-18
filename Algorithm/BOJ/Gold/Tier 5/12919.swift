//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 3/18/25.
//

let s = readLine()!
let t = readLine()!
var find = false

func recursion(string: String) {
    if find { return }
    if string.isEmpty { return }
    if string == s {
        find = true
        return
    }
    
    
    if string.last! == "A" {
        recursion(string: String(string.dropLast()))
    }
    
    if string.first! == "B" {
        recursion(string: String(string.dropFirst().reversed()))
    }

}

recursion(string: t)

print(find ? 1 : 0)
