//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 8/27/24.
//

struct Queue<T> {
    var array: [T] = []
    private var pointer = 0
    
    mutating func enqueue(_ element: T) {
        array.append(element)
    }
    
    mutating func enqueue(_ elements: [T]) {
        array += elements
    }
    
    mutating func dequeue() -> T {
        defer { pointer += 1 }
        return array[pointer]
    }
    
    mutating func removeAll() {
        array.removeAll()
    }
    
    var isEmpty: Bool {
        return array[pointer...].isEmpty
    }
}


let MNH = readLine()!.split(separator: " ").map { Int($0)! }
let m = MNH[0]
let n = MNH[1]
let h = MNH[2]
let directions = [(-1, 0, 0), (1, 0, 0), (0, -1, 0), (0, 1, 0), (0, 0, -1), (0, 0, 1)]

var graph = Array(repeating: Array(repeating: Array(repeating: 0, count: 0), count: 0), count: h)
var visited = Array(repeating: Array(repeating: Array(repeating: false, count: m), count: n), count: h)
var ripeTomatoes: [(Int, Int, Int)] = []
var rawToamatoesCount = 0
var roastedToamatoesCount = 0
var day = -1

for i in 0..<h {
    for _ in 0..<n {
        let line = readLine()!.split(separator: " ").map { Int($0)! }
        graph[i].append(line)
    }
}

for i in 0..<h {
    for j in 0..<n {
        for k in 0..<m {
            if graph[i][j][k] == 1 {
                ripeTomatoes.append((i, j, k))
            } else if graph[i][j][k] == 0 {
                rawToamatoesCount += 1
            }
        }
    }
}


func bfs(start: [(Int, Int, Int)]) {
    var needVisitQueue = Queue<(Int, Int, Int)>()
    needVisitQueue.enqueue(start)
    var nextVisitQueue = Queue<(Int, Int, Int)>()
    
    while !needVisitQueue.isEmpty {
        let currentTomato = needVisitQueue.dequeue()
        let z = currentTomato.0
        let y = currentTomato.1
        let x = currentTomato.2
        
        visited[z][y][x] = true
        
        for direction in directions {
            let nextX = currentTomato.2 + direction.2
            let nextY = currentTomato.1 + direction.1
            let nextZ = currentTomato.0 + direction.0
            
            if nextX < 0 || nextX >= m || nextY < 0 || nextY >= n || nextZ < 0 || nextZ >= h { continue }
            if visited[nextZ][nextY][nextX] || graph[nextZ][nextY][nextX] == -1 || graph[nextZ][nextY][nextX] == 1 { continue }
            
            graph[nextZ][nextY][nextX] = 1
            nextVisitQueue.enqueue((nextZ, nextY, nextX))
            roastedToamatoesCount += 1
        }
        
        if needVisitQueue.isEmpty {
            needVisitQueue = nextVisitQueue
            nextVisitQueue.removeAll()
            day += 1
        }
    }
    
}

bfs(start: ripeTomatoes)

if rawToamatoesCount == 0 {
    print(0)
} else if roastedToamatoesCount != rawToamatoesCount {
    print(-1)
} else { print(day) }


