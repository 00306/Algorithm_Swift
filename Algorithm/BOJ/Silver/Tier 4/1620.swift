//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 5/1/24.
//

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0]
let m = input[1]
var answer = ""

var pokemonString_dict: [String: Int] = [:]
var pokemonInt_dict: [Int: String] = [:]

for i in 1...n {
    let pokemon = readLine()!
    pokemonString_dict[pokemon] = i
    pokemonInt_dict[i] = pokemon
}

for _ in 0..<m {
    let question = readLine()!
    if Int(question) == nil {
        answer += "\(pokemonString_dict[question]!)\n"
    } else {
        answer += "\(pokemonInt_dict[Int(question)!]!)\n"
    }
}


print(answer)
