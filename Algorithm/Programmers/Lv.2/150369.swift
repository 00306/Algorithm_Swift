//
//  150369.swift
//  Algorithm
//
//  Created by 송지혁 on 5/25/26.
//

import Foundation

func solution(_ cap: Int, _ n: Int, _ deliveries: [Int], _ pickups: [Int]) -> Int64 {
    var distance = 0
    var deliverSum = 0
    var pickupSum = 0
    
    for i in stride(from: n-1, through: 0, by: -1) {
        deliverSum += deliveries[i]
        pickupSum += pickups[i]
        
        while deliverSum > 0 || pickupSum > 0 {
            distance += (i+1)*2
            
            deliverSum -= cap
            pickupSum -= cap
        }
        
    }
    
    return Int64(distance)
}
