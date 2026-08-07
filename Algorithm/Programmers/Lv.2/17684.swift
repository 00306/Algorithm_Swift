//
//  17684.swift
//  Algorithm
//
//  Created by 송지혁 on 8/7/26.
//

func solution(_ msg: String) -> [Int] {
    var dict: [String: Int] = [
        "A": 1, "B": 2, "C": 3, "D": 4, "E": 5, "F": 6, "G": 7, "H": 8, "I": 9,
        "J": 10, "K": 11, "L": 12, "M": 13, "N": 14, "O": 15, "P": 16, "Q": 17, "R": 18, "S": 19, "T": 20, "U": 21, "V": 22, "W": 23, "X": 24, "Y": 25, "Z": 26
    ]
    var count = 27
    var result: [Int] = []
    let msgArray = msg.map { String($0) }
    var i = 0
    
    while i < msgArray.count {
        var current = msgArray[i]
        var j = 1
        
        while i+j < msgArray.count {
            let next = msgArray[i+j]
            
            if dict[current + next] == nil {
                result.append(dict[current]!)
                dict[current + next] = count
                count += 1
                current = ""
                i += j
                break
                
            } else {
                current += next
                j += 1
            }
        }
        
        if !current.isEmpty {
            result.append(dict[current]!)
            i += j
        }
    }
    
    return result
}
