//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 12/16/24.
//

let AB = readLine()!.split(separator: " ").map { Int($0)! }
let A = AB[0]
var B = AB[1]
var count = 0



while B > A {
    
    if B % 10 == 1 { B /= 10 }
    else if B % 2 != 0 { break }
    else { B /= 2 }
    
    count += 1
    
    if B == A {
        count += 1
        break
    }
    
}

print(B == A ? count : -1)
