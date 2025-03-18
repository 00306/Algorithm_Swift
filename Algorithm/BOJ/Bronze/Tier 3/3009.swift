//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 4/17/24.
//

let vertex1 = readLine()!.split(separator: " ").map { Int($0)! }
let vertex2 = readLine()!.split(separator: " ").map { Int($0)! }
let vertex3 = readLine()!.split(separator: " ").map { Int($0)! }

let xVertex = vertex1[0] - vertex2[0] == 0 ? vertex3[0] : vertex1[0] - vertex3[0] == 0 ? vertex2[0] : vertex1[0]
let yVertex = vertex1[1] - vertex2[1] == 0 ? vertex3[1] : vertex1[1] - vertex3[1] == 0 ? vertex2[1] : vertex1[1]


print(xVertex, yVertex)


