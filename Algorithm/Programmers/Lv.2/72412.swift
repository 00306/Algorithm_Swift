//
//  72412.swift
//  Algorithm
//
//  Created by 송지혁 on 6/23/26.
//

import Foundation

func solution(_ info: [String], _ query: [String]) -> [Int] {
    var table: [String: [Int]] = [:]
    var result: [Int] = []
    
    for infoString in info {
        let informations = infoString.split(separator: " ").map { String($0) }
        let language = [informations[0], "-"]
        let job = [informations[1], "-"]
        let career = [informations[2], "-"]
        let food = [informations[3], "-"]
        let score = Int(informations[4])!
        
        for l in language {
            for j in job {
                for c in career {
                    for f in food {
                        let key = "\(l) \(j) \(c) \(f)"
                        table[key, default: []].append(score)
                    }
                }
            }
        }
    }
    
    for (key, _) in table {
        table[key]?.sort()
    }
    
    for q in query {
        let queries = q.split(separator: " and ")
        let language = queries[0]
        let job = queries[1]
        let career = queries[2]
        let foodAndScore = queries[3].split(separator: " ").map { String($0) }
        let food = foodAndScore[0]
        
        let score = Int(foodAndScore[1])!
        
        let key = "\(language) \(job) \(career) \(food)"
        guard let scores = table[key] else {
            result.append(0)
            continue
        }
        
        var start = 0
        var end = scores.count
        
        while start < end {
            let mid = (start + end) / 2
            
            if scores[mid] < score {
                start = mid + 1
            } else {
                end = mid
            }
        }
        
        result.append(scores.count - start)
        
    }
    
    return result
}
