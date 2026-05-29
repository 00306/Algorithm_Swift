//
//  92342.swift
//  Algorithm
//
//  Created by 송지혁 on 5/29/26.
//

import Foundation

func selectedRangeCombination(n: Int) -> [[Int]] {
    var combinations: [[Int]] = []
    
    func dfs(current: [Int]) {
        if current.count == n {
            combinations.append(current)
            return
        }
        
        dfs(current: current + [1])
        dfs(current: current + [0])
    }
    
    dfs(current: [])
    
    return combinations
}

func solution(_ n: Int, _ info: [Int]) -> [Int] {
    let combinations = selectedRangeCombination(n: 11)
    var result = Array(repeating: 0, count: 11)
    var gap = 0
    
    for combination in combinations {
        var arrowCount = n
        var scoreBoard = Array(repeating: 0, count: 11)
        
        for i in 0..<combination.count {
            if arrowCount < 1 { break }
            if combination[i] == 0 { continue }
            
            let inputArrow = arrowCount >= info[i] + 1 ? info[i] + 1 : 0
            scoreBoard[i] = inputArrow
            arrowCount -= inputArrow
        }
        
        if arrowCount > 0 { scoreBoard[10] += arrowCount }
        
        var opponentScore = 0
        var myScore = 0
        
        for i in 0..<scoreBoard.count {
            if scoreBoard[i] > info[i] {
                myScore += 10-i
            } else if info[i] > 0 {
                opponentScore += 10-i
            }
        }
        
        if opponentScore >= myScore { continue }
        if gap > myScore - opponentScore { continue }
        if gap == myScore - opponentScore {
            var myLowerCount = 0
            var resultLowerCount = 0
            
            for i in stride(from: result.count-1, to: -1, by: -1) {
                if scoreBoard[i] > result[i] {
                    result = scoreBoard
                    break
                } else if scoreBoard[i] < result[i] {
                    break
                }
            }
        } else {
            result = scoreBoard
            gap = myScore - opponentScore
        }
    }
    
    if gap == 0 {
        return [-1]
    }
    
    return result
}
