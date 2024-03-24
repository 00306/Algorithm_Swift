//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 3/11/24.
//
//
import Foundation

guard let num1 = Int(readLine()!), let num2 = Int(readLine()!) else { exit(1) }

let num2UnitDigit = num2 % 10
let num2TensDigit = (num2 % 100) / 10
let num2HundredsDigit = num2 / 100

let calculation1 = num1 * num2UnitDigit
let calculation2 = num1 * num2TensDigit
let calculation3 = num1 * num2HundredsDigit
let result = num1 * num2

print(calculation1)
print(calculation2)
print(calculation3)
print(result)
