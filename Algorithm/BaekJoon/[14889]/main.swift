//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 5/30/24.
//

let n = Int(readLine()!)!
var board: [[Int]] = []
var result = Int.max

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    board.append(input)
}

dfs(0, [])
print(result)

func dfs(_ index: Int, _ team: [Int]) {
    if team.count == n / 2 {
        let otherTeam = (1...n).filter { !team.contains($0) }
        var teamScore = 0
        var otherTeamScore = 0
        
        for i in 0..<team.count {
            for j in i+1..<team.count {
                teamScore += board[team[j] - 1][team[i] - 1]
                teamScore += board[team[i] - 1][team[j] - 1]
                otherTeamScore += board[otherTeam[j] - 1][otherTeam[i] - 1]
                otherTeamScore += board[otherTeam[i] - 1][otherTeam[j] - 1]
            }
        }
        
        result = min(result, abs(teamScore - otherTeamScore))
        
        return
    }
    
    for i in 1..<n-index+1 {
        dfs(index + i, team + [index + i])
    }
    
}
