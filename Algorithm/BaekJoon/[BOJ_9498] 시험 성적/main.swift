//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 3/27/24.
//

import Foundation

let input = Int(readLine()!)!

switch input {
    case 90...100:
        print("A")
    case 80...89:
        print("B")
    case 70...79:
        print("C")
    case 60...69:
        print("D")
    default: print("F")
}
