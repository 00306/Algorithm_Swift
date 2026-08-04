//
//  42888.swift
//  Algorithm
//
//  Created by 송지혁 on 8/4/26.
//

import Foundation

func solution(_ record: [String]) -> [String] {
    var nicknameDict: [String: String] = [:]
    var logs: [[String]] = []
    var result: [String] = []
    
    for log in record {
        let logArray = log.split(separator: " ").map { String($0) }
        let order = logArray[0]
        let uid = logArray[1]
        
        if order == "Enter" {
            let nickname = logArray[2]
            nicknameDict[uid] = nickname
        } else if order == "Change" {
            let nickname = logArray[2]
            nicknameDict[uid] = nickname
        }
        
        logs.append(logArray)
    }
    
    for log in logs {
        let order = log[0]
        let uid = log[1]
        
        if order == "Enter" {
            result.append("\(nicknameDict[uid]!)님이 들어왔습니다.")
        } else if order == "Leave" {
            result.append("\(nicknameDict[uid]!)님이 나갔습니다.")
        }
    }
    
    return result
}
