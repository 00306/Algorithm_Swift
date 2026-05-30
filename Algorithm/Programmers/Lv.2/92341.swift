//
//  92341.swift
//  Algorithm
//
//  Created by 송지혁 on 5/30/26.
//

import Foundation

func recordToReceipt(_ records: [String]) -> [String: (Int, Int, Int)] {
    var receipts: [String: (Int, Int, Int)] = [:]
    
    for record in records {
        let splittedRecord = record.split(separator: " ").map { String($0) }
        let minute = toMinute(from: splittedRecord[0])
        let carNumber = splittedRecord[1]
        let content = splittedRecord[2]
        
        
        let receipt = receipts[carNumber, default: (1439, 1439, 0)]
        
        
        if content == "IN" {
            if minute > receipt.1 {
                receipts[carNumber, default: (1439, 1439, 0)] = (minute, 1439, receipt.2)
            } else {
                receipts[carNumber, default: (1439, 1439, 0)].0 = minute
            }
            
        } else if content == "OUT" {
            let duration = minute - receipt.0
            receipts[carNumber, default: (1439, 1439, 0)] = (1439, 1439, receipt.2 + duration)
            
        }
    }
    
    return receipts
}

func toMinute(from time: String) -> Int {
    let splittedTime = time.split(separator: ":")
    let hour = splittedTime[0]
    let minute = splittedTime[1]
    
    return Int(hour)! * 60 + Int(minute)!
}

func calculatePrice(_ fees: [Int], inTime: Int, outTime: Int, cumulativeTime: Int) -> Int {
    let duration = outTime - inTime + cumulativeTime
    let baseTime = fees[0]
    let basePrice = fees[1]
    let unitTime = fees[2]
    let unitPrice = fees[3]
    
    var totalPrice = 0
    
    if duration == 0 { return 0 }
    
    if duration <= baseTime { return basePrice }
    let overPrice = Int(ceil((Double(duration - baseTime) / Double(unitTime)))) * unitPrice
    
    totalPrice += basePrice + overPrice
    
    return totalPrice
}

func solution(_ fees: [Int], _ records: [String]) -> [Int] {
    let receipts = recordToReceipt(records)
    var prices: [String: Int] = [:]
    
    for (key, value) in receipts {
        let price = calculatePrice(fees,
                                   inTime: value.0,
                                   outTime: value.1,
                                   cumulativeTime: value.2
        )
        
        prices[key, default: 0] = price
    }
    
    return prices.sorted(by: { $0.key < $1.key }).map { $0.value }
}
