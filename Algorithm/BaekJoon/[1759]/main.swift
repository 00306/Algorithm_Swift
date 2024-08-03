//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 8/25/24.
//

let LC = readLine()!.split(separator: " ").map { Int($0)! }
let l = LC[0]
let c = LC[1]
let alphabets = readLine()!.split(separator: " ").map { String($0) }.sorted()
var result = ""

func dfs(start: Int, array: [String]) {
    if array.count == l {
        var vowels = 0
        for element in array {
            if ["a", "e", "i", "o", "u"].contains(element) { vowels += 1 }
        }
        
        if vowels >= 1 && l - vowels >= 2 {
            result += "\(array.joined(separator: ""))\n"
        }
        
        return
    }
    
    for i in start..<alphabets.count {
        dfs(start: i + 1, array: array + [alphabets[i]])
    }
}

dfs(start: 0, array: [])

print(result)
