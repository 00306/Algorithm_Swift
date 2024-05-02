//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 5/2/24.
//

import Foundation

let t = Int(readLine()!)!
var result = ""

for _ in 0..<t {
    let numbers = readLine()!.split(separator: " ").map { Int($0)! }
    let num1 = numbers[0]
    let num2 = numbers[1]
    
    result += "\(getLeastCommonMultiple(num1, num2))\n"
}

print(result)

// 1. 각 수의 약수를 구한다.
// 2. 공약수를 구한다.
// 3. 최대 공약수를 구한다.
// 4. 둘의 곱을 최대 공약수로 나눈다.


// 최소 공배수 구하기
func getLeastCommonMultiple(_ num1: Int, _ num2: Int) -> Int {
    let measures1 = getMeasures(Double(num1))
    let measures2 = getMeasures(Double(num2))
    let commonFactor = getCommonFactor(measures1, measures2)
    let greatestCommonFactor = getGreatestCommonFactor(commonFactor)
    
    
    return (num1 * num2) / greatestCommonFactor
}


// 약수 구하기
func getMeasures(_ num: Double) -> [Int] {
    var measures: [Int] = []
    
    for i in 1...Int(sqrt(num)) {
        if Int(num) % i == 0 {
            if i*i != Int(num) {
                measures.append(Int(num) / i)
            }
            
            measures.append(i)
        }
    }
    
    return measures
}

// 공약수 구하기
private func getCommonFactor(_ measures1: [Int], _ measures2: [Int]) -> [Int] {
    var commonFactor: [Int] = []
    let measures1_dict = convertArrToDict(measures1)
    
    measures2.forEach {
        if measures1_dict[$0] != nil {
            commonFactor.append($0)
        }
    }
    
    return commonFactor
}

// arr -> dict
private func convertArrToDict<T>(_ arr: [T]) -> Dictionary<T, Int> {
    return Dictionary(uniqueKeysWithValues: arr.map { ($0, 0) })
}

// 최대 공약수 구하기
private func getGreatestCommonFactor(_ commonFactor: [Int] = [0]) -> Int {
    return commonFactor.isEmpty ? 1 : commonFactor.max()!
}
