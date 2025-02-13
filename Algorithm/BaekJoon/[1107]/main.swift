//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 2/13/25.
//

import Foundation

let target = Int(readLine()!)!
let deactivatedButtonCount = Int(readLine()!)!
let deactivatedButtons = deactivatedButtonCount != 0 ? readLine()!.split(separator: " ").map { Int($0)! } : []
let initialPosition = 100

func checkValidation(of number: Int, unavailables: [Int]) -> Bool {
    if number == 0, unavailables.contains(number) { return false }
    var currentNumber = number
    while currentNumber > 0 {
        if unavailables.contains(currentNumber % 10) { return false }
        currentNumber /= 10
    }
    
    return true
}

func getApproximateDistance(target: Int) -> Int {
    var lowerApproximateNumber = target
    var upperApproximateNumber = target
    
    while true {
        if lowerApproximateNumber >= 0 {
            if !checkValidation(of: lowerApproximateNumber, unavailables: deactivatedButtons) {
                lowerApproximateNumber -= 1
            } else { break }
        }
        
        if !checkValidation(of: upperApproximateNumber, unavailables: deactivatedButtons) {
            upperApproximateNumber += 1
        } else { break }
    }
    
    if target - lowerApproximateNumber > upperApproximateNumber - target || lowerApproximateNumber < 0 {
        return upperApproximateNumber
    } else { return lowerApproximateNumber }
}

func countDigits(of number: Int) -> Int {
    if number == 0 { return 1 }
    var digits = 0
    var currentNumber = number
    
    while currentNumber > 0 {
        digits += 1
        currentNumber /= 10
    }
    
    return digits
}

let initialDistance = abs(target - initialPosition)

if deactivatedButtons.count == 10 {
    print(initialDistance)
} else {
    let approximateNumber = getApproximateDistance(target: target)
    let approximateDistance = abs(target - approximateNumber) + countDigits(of: approximateNumber)
    print(min(initialDistance, approximateDistance))
}

