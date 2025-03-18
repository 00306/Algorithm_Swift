//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 4/15/24.
//

var N = Int(readLine()!)!
var i = 2

while N != 1 {
    
    if N%i == 0 {
        print(i)
        N/=i
        i = 2
        
    } else {
        i+=1
    }
}
