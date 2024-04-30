//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 4/30/24.
//

let s = readLine()!.map { String($0) }
var str_set: Set<String> = []


for i in 0..<s.count {
    var str = ""
    for j in i..<s.count {
        str += s[j]
        str_set.insert(str)
    }
    
    
}

print(str_set.count)
