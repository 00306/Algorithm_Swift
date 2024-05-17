//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 5/17/24.
//

let n = Int(readLine()!)!
var dictionary: [String:Bool] = [:]


for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { String($0) }
    let firstPerson = input[0]
    let secondPerson = input[1]
    if firstPerson == "ChongChong" || secondPerson == "ChongChong" {
       dictionary[firstPerson] = true
       dictionary[secondPerson] = true
    }
    
    if dictionary[firstPerson] != nil || dictionary[secondPerson] != nil {
        if dictionary[firstPerson] == true || dictionary[secondPerson] == true {
            dictionary[firstPerson] = true
            dictionary[secondPerson] = true
        } else {
            dictionary[firstPerson] = false
            dictionary[secondPerson] = false
        }
    }
    
    
}

print(dictionary.filter { $0.value }.count)
