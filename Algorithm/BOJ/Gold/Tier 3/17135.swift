//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 5/14/25.
//

struct Coordinate: Hashable {
    let y: Int
    let x: Int
    
    init(_ y: Int, _ x: Int) {
        self.y = y
        self.x = x
    }
}

let NMD = readLine()!.split(separator: " ").map { Int($0)! }
let N = NMD[0]
let M = NMD[1]
let D = NMD[2]

func getArcherRange(max: Int) -> [Coordinate] {
    let base: Coordinate = Coordinate(1, 0)
    var ranges: [Coordinate] = []
    
    for dy in 0...(max-1) {
        for dx in -(max-1)...(max-1) {
            if abs(dx) + abs(dy) <= max-1 {
                ranges.append(Coordinate(base.y + dy, base.x + dx))
            }
        }
    }
    
    return ranges
}

func findArcherRowPosition(row: Int, column: Int) -> [[Coordinate]] {
    var positions: [[Coordinate]] = []
    
    func dfs(start: Int, path: [Int]) {
        if path.count == 3 {
            
            positions.append(path.map { Coordinate(column, $0) })
            return
        }
        
        for i in start..<row {
            dfs(start: i+1, path: path + [i])
        }
    }
    
    
    dfs(start: 0, path: [])
    return positions
}

var map: [[Int]] = []

for _ in 0..<N {
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    map.append(line)
}

let archerPositions = findArcherRowPosition(row: M, column: N)
let ranges = getArcherRange(max: D).sorted {
    let left = abs($0.x) + abs($0.y)
    let right = abs($1.x) + abs($1.y)
    
    if left != right { return left < right }
    return $0.x < $1.x
}
var result = 0

func bfs(map: [[Int]], archerPosition: [Coordinate]) -> Int {
    var currentMap = map
    var queue = archerPosition
    var head = 0
    var kills = 0
    var hits: Set<Coordinate> = []
    var prevLevel = N
    
    while head < queue.count {
        let coordinate = queue[head]
        head += 1
        
        if prevLevel != coordinate.y {
            kills += hits.count
            hits.forEach { currentMap[$0.y][$0.x] = 0 }
            prevLevel = coordinate.y
            hits = []
        }
        
        if coordinate.y == 0 { continue }
        
        for range in ranges {
            let targetX = coordinate.x + range.x
            let targetY = coordinate.y - range.y
            
            guard (0..<M) ~= targetX && (0..<N) ~= targetY else { continue }
            
            if currentMap[targetY][targetX] == 1 {
                hits.insert(Coordinate(targetY, targetX))
                break
            }
        }
        
        queue.append(Coordinate(coordinate.y - 1, coordinate.x))
    }
    
    
    return kills
}

for archerPosition in archerPositions {
    result = max(result, bfs(map: map, archerPosition: archerPosition))
}

print(result)
