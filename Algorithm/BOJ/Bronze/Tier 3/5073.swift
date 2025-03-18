//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 4/19/24.
//

while true {
    let input = readLine()!.split(separator: " ").map { Int($0)! }.sorted()
    
    if input == [0,0,0] {
        break
    }
    
    if input[2] < input[0] + input[1] {
        print(Set(input).count == 3 ? "Scalene" : Set(input).count == 2 ? "Isosceles" : "Equilateral")
        
    } else {
        print("Invalid")
    }
}


// Foundation을 import 하니까 4ms가 증가한다.
