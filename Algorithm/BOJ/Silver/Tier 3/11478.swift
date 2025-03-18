//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 4/30/24.
//

let s = readLine()!
var str_set: Set<Substring> = []

// 문자열 index
for i in s.indices {
    
    // i 번째 문자 이후 문자열의 index
    for j in s.indices[i...] {
        // set에 추가하고자 하는 값이 있다면 추가하지 않고, 없다면 추가
        str_set.update(with: s[i...j])
    }
}

print(str_set.count)
