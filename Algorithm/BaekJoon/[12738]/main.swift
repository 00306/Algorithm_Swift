//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 10/28/24.
//

let n = Int(readLine()!)!
let numbers = readLine()!.split(separator: " ").map { Int($0)! }
var lis: [Int] = []

for num in numbers {
    var left = 0
    var right = lis.count - 1
    
    if lis.isEmpty || lis.last! < num {
        lis.append(num)
    } else {
        
        
        while left < right {
            let mid = (left + right) / 2
            
            if lis[mid] >= num {
                right = mid
            } else {
                left = mid + 1
            }
        }
        
        lis[left] = num
    }
}

print(lis.count)
