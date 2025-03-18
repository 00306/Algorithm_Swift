//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 4/8/24.
//

import Foundation

var word = readLine()!
let croatiaAlphabet = ["c=", "c-", "dz=", "d-", "lj", "nj", "s=", "z="]

croatiaAlphabet.forEach { alphabet in
    word = word.replacingOccurrences(of: alphabet, with: "1")
}

print(word.count)
