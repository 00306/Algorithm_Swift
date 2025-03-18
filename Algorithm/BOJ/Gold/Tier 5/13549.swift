//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 9/4/24.
//

let NK = readLine()!.split(separator: " ").map { Int($0)! }
let n = NK[0]
let k = NK[1]

func bfs(start: Int) -> Int {
    var visited = Array(repeating: false, count: 100002)
    var time = Array(repeating: 0, count: 100002)
    var needVisitQueue = [start]
    
    while !needVisitQueue.isEmpty {
        let position = needVisitQueue.removeFirst()
        
        if position == k { break }
        
        if position * 2 <= 100001 && !visited[position * 2] {
            needVisitQueue.append(position * 2)
            visited[position * 2] = true
            time[position * 2] = time[position]
        }
        
        if position - 1 >= 0 && !visited[position - 1] {
            needVisitQueue.append(position - 1)
            visited[position - 1] = true
            time[position - 1] = time[position] + 1
        }
        
        if position + 1 <= 100001 && !visited[position + 1] {
            needVisitQueue.append(position + 1)
            visited[position + 1] = true
            time[position + 1] = time[position] + 1
        }
    }
    
    return time[k]
}

print(bfs(start: n))
