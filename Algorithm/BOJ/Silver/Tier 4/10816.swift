//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 5/2/24.
//

let n = Int(readLine()!)!
let cards = readLine()!.split(separator: " ").map { Int($0)! }
var cards_dict: [Int:Int] = [:]
var result = ""


let m = Int(readLine()!)!
let numbers = readLine()!.split(separator: " ").map { Int($0)! }


cards.forEach { card in
    cards_dict[card, default: 0] += 1
}


numbers.forEach { number in
    result += "\(cards_dict[number] ?? 0) "
}

print(result)
