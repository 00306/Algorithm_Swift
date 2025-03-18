//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 5/16/24.
//

let n = Int(readLine()!)!

var chats: [String] = []
var nicknames: Set<String> = []
var result = 0

for _ in 0..<n {
    chats.append(readLine()!)
}

for i in 0..<chats.count {
    nicknames.insert(chats[i])
    
    if chats[i] == "ENTER" {
        result += nicknames.count - 1
        nicknames.removeAll()
    }
}
result += nicknames.count

print(result)
