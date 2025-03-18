//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 8/29/24.
//

let NM = readLine()!.split(separator: " ").map { Int($0)! }
let n = NM[0]
let m = NM[1]
let directions: [(dy: Int, dx: Int)] = [(0, 1), (1, 0), (0, -1), (-1, 0)]

var map: [[Int]] = []
var cctvs: [(y: Int, x: Int, type: Int)] = []
var result = Int.max
var emptyCount = 0

for _ in 0..<n {
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    map.append(line)
}

for i in 0..<n {
    for j in 0..<m {
        if map[i][j] != 0 && map[i][j] != 6 {
            cctvs.append((i, j, map[i][j]))
        } else if map[i][j] == 0 {
            emptyCount += 1
        }
    }
}

func rotate(direction: (dy: Int, dx: Int), times: Int) -> (dy: Int, dx: Int) {
    let index = directions.firstIndex { $0 == direction }!
    let newIndex = (index + times) % 4
    return directions[newIndex]
}

func surveillance(y: Int, x: Int, direction: (Int, Int)) -> Int {
    var nextX = x + direction.1
    var nextY = y + direction.0
    var count = 0
    
    while !(nextX < 0 || nextX >= m || nextY < 0 || nextY >= n || map[nextY][nextX] == 6) {
        if map[nextY][nextX] == 0 {
            map[nextY][nextX] = 9
            count += 1
        }
        nextX += direction.1
        nextY += direction.0
    }
 
    return count
}

func dfs(start: Int, count: Int) {
    if start >= cctvs.count {
        result = min(result, emptyCount - count)
        return
    }
    
    let cctv = cctvs[start]
    let x = cctv.x
    let y = cctv.y
    let type = cctv.type
    
    let directionSets: [[(dy: Int, dx: Int)]]
    
    switch type {
        case 1:
            directionSets = [[directions[0]], [directions[1]], 
                             [directions[2]], [directions[3]]]
        case 2:
            directionSets = [[directions[0], directions[2]], 
                             [directions[1], directions[3]]]
        case 3:
            directionSets = [[directions[0], directions[3]], 
                             [directions[0], directions[1]],
                             [directions[1], directions[2]],
                             [directions[2], directions[3]]]
        case 4:
            directionSets = [[directions[0], directions[2], directions[3]], 
                             [directions[0], directions[1], directions[3]],
                             [directions[0], directions[1], directions[2]],
                             [directions[1], directions[2], directions[3]]]
        case 5:
            directionSets = [directions]
        default:
            directionSets = []
    }
    
    let tempMap = map
    let originalCount = count
    
    for directionSet in directionSets {
        var surveillanceCount = originalCount
        
        for direction in directionSet {
            surveillanceCount += surveillance(y: y, x: x, direction: direction)
        }
    
        dfs(start: start + 1, count: surveillanceCount)
        
        map = tempMap
    }
}


dfs(start: 0, count: 0)

print(result)
