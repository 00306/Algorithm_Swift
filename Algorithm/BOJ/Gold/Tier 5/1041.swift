//
//  1041.swift
//  Algorithm
//
//  Created by 송지혁 on 3/31/25.
//

import Foundation

let n = Int(readLine()!)!
var scales = readLine()!.split(separator: " ").map { Int($0)! }
let initialSum = scales.reduce(0, +) - scales.max()!

func getMinWithMaxOpposite(scales: inout [Int], remove: Bool) -> Int {
    let minScale = scales.min()!
    let maxIndex = scales.count - 1
    var maxIndexApartMin = maxIndex - scales.firstIndex(of: minScale)!
    
    for i in 0..<scales.count where scales[i] == minScale {
        let apartIndex = maxIndex-i
        let apartScale = scales[apartIndex]
        let currentMaxApartMin = scales[maxIndexApartMin]
        
        if apartScale > currentMaxApartMin {
            maxIndexApartMin = apartIndex
        }
    }
    
    if remove {
        scales[maxIndexApartMin] = Int.max
        scales[maxIndex - maxIndexApartMin] = Int.max
    }
    
    return minScale
}

let firstMinValue = getMinWithMaxOpposite(scales: &scales, remove: true)
let secondMinValue = getMinWithMaxOpposite(scales: &scales, remove: true)
let thirdMinValue = getMinWithMaxOpposite(scales: &scales, remove: true)

let twoSurfaceMinSum = firstMinValue + secondMinValue
let threeSurfaceMinSum = twoSurfaceMinSum + thirdMinValue
let totalSurfaceCount = n * n * 5
let oneSurfaceCount = (n-1) * (n-2) * 4 + (n-2) * (n-2)
let twoSurfaceCount = (totalSurfaceCount - (oneSurfaceCount + 4 * 3)) / 2

let totalOneSurfaceSum = oneSurfaceCount * firstMinValue
let totalThreeSurfaceSum = threeSurfaceMinSum * 4
let totalTwoSurfaceSum = twoSurfaceCount * twoSurfaceMinSum

let result = totalOneSurfaceSum + totalTwoSurfaceSum + totalThreeSurfaceSum

print(n == 1 ? initialSum : result)
