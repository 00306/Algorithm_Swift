//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 3/30/25.
//

let n = Int(readLine()!)!
let crainLimits = readLine()!.split(separator: " ").map { Int($0)! }.sorted()
let maxLimit = crainLimits.max()!
let m = Int(readLine()!)!
let boxWeights = readLine()!.split(separator: " ").map { Int($0)! }.sorted(by: { $0 > $1 })

var crains: [(limit: Int, schedule: [Int])] = []

for limit in crainLimits {
    let crain = (limit: limit, schedule: [Int]())
    crains.append(crain)
}

var result = Int.min

for weight in boxWeights {
    if weight > maxLimit {
        result = -1
        break
    }
    
    let candidateIndex =
        crains
            .enumerated()
            .filter { $0.element.limit >= weight }
            .min(by: {
                if $0.element.schedule.count == $1.element.schedule.count {
                    return $0.element.limit < $1.element.limit
                }
                return $0.element.schedule.count < $1.element.schedule.count }
            )!
            .offset
    
    crains[candidateIndex].schedule.append(weight)
}

result = result == -1 ? -1 : crains.max(by: { $0.schedule.count < $1.schedule.count })!.schedule.count

print(result)
