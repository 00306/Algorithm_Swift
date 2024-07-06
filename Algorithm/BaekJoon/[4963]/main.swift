//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 7/6/24.
//

var result = ""

while true {
    let sizeOfMap = readLine()!.split(separator: " ").map { Int($0)! }
    let width = sizeOfMap[0]
    let height = sizeOfMap[1]
    if width == 0, height == 0 { break }
    
    var visited = Array(repeating: Array(repeating: false, count: width), count: height)
    var map: [[Int]] = []
    var count = 0
    
    for _ in 0..<height {
        let line = readLine()!.split(separator: " ").map { Int(String($0))! }
        map.append(line)
    }
    
    
    for i in 0..<height {
        for j in 0..<width {
            if map[i][j] == 1 {
                if !visited[i][j] {
                    bfs(map: map, i: i, j: j)
                    count += 1
                }
            }
        }
    }
    
    result += "\(count)\n"
    
    func bfs(map: [[Int]], i: Int, j: Int) {
        var needVisitQueue: [(y: Int, x: Int)] = [(i, j)]
        
        while !needVisitQueue.isEmpty {
            let node = needVisitQueue.removeFirst()
            if node.0 >= height || node.0 < 0 || node.1 >= width || node.1 < 0 || visited[node.y][node.x] || map[node.y][node.x] == 0 { continue }
            visited[node.y][node.x] = true
            needVisitQueue.append(contentsOf: [(node.y, node.x + 1), (node.y, node.x - 1), (node.y - 1, node.x), (node.y + 1, node.x), (node.y + 1, node.x + 1), (node.y - 1, node.x - 1), (node.y - 1, node.x + 1), (node.y + 1, node.x - 1)])
            
        }
    }
}



print(result)
