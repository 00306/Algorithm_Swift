//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 4/14/24.
//

let input = readLine()!.split(separator: " ").map { Int($0)! }
var N = input[0]
let B = input[1]
var dict_alphabet = [Int: String]()
var arr_formation: [Int] = []

var answer = ""

for i in 10...35 {
    let num = 55
    dict_alphabet[i] = String(UnicodeScalar(i+num)!)
}

while N != 0 {
    arr_formation.append(N % B)
    N /= B
}

for i in 0..<arr_formation.count {
    let index = arr_formation.count - 1 - i
    
    if arr_formation[index] >= 10 {
        answer += dict_alphabet[arr_formation[index]]!
    } else {
        answer += String(arr_formation[index])
    }
}


print(answer)
