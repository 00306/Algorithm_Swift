//
//  84021.swift
//  Algorithm
//
//  Created by 송지혁 on 4/30/26.
//


func extractShape(graph: [[Int]], target: Int) -> [[(Int, Int)]] {
    var visited = Array(repeating: [Bool](repeating: false,
                                          count: graph[0].count),
                        count: graph.count)
    
    var shapes: [[(Int, Int)]] = []
    let directions = [(-1, 0), (0, 1), (1, 0), (0, -1)]
    
    func dfs(y: Int, x: Int) -> [(Int, Int)] {
        visited[y][x] = true
        var shape: [(Int, Int)] = [(y, x)]
        
        for direction in directions {
            let nextY = y + direction.0
            let nextX = x + direction.1
            
            if nextY < 0 || nextY >= graph.count ||
                nextX < 0 || nextX >= graph[0].count { continue }
            if visited[nextY][nextX] { continue }
            if graph[nextY][nextX] != target {continue }
            
            shape += dfs(y: nextY, x: nextX)
            
            
            
        }
        
        return shape
    }
    
    for i in 0..<graph.count {
        for j in 0..<graph[0].count {
            if visited[i][j] { continue }
            if graph[i][j] != target { continue }
            
            let shape = dfs(y: i, x: j)
            shapes.append(shape)
        }
    }
    
    return shapes
}

func normalized(coordinates: [(Int, Int)]) -> [(Int, Int)] {
    let minY = coordinates.min { $0.0 < $1.0 }!.0
    let minX = coordinates.min { $0.1 < $1.1 }!.1
    
    var normalizedCoordinates: [(Int, Int)] = []
    
    for i in 0..<coordinates.count {
        normalizedCoordinates.append((coordinates[i].0 - minY, coordinates[i].1 - minX))
    }
    
    return normalizedCoordinates
}

func rotation(coordinates: [(Int, Int)], normalize: Bool = true) -> [(Int, Int)] {
    var newCoordinates: [(Int, Int)] = []
    
    for coordinate in coordinates {
        let y = coordinate.0
        let x = coordinate.1
        
        newCoordinates.append((x, -y))
        
    }
    
    if normalize {
        newCoordinates = normalized(coordinates: newCoordinates)
    }
    
    return newCoordinates
}

func isSameShape(_ a: [(Int, Int)], _ b: [(Int, Int)]) -> Bool {
    let sortedA = a.sorted {
        if $0.0 == $1.0 {
            return $0.1 < $1.1
        }
        
        return $0.0 < $1.0
    }
    
    let sortedB = b.sorted {
        if $0.0 == $1.0 {
            return $0.1 < $1.1
        }
        
        return $0.0 < $1.0
    }
    
    for i in 0..<sortedA.count {
        if sortedA[i].0 != sortedB[i].0 { return false }
        if sortedA[i].1 != sortedB[i].1 { return false }
    }
    
    return true
}

func solution(_ game_board: [[Int]], _ table: [[Int]]) -> Int {
    let emptySpaces = extractShape(graph: game_board, target: 0)
    let puzzles = extractShape(graph: table, target: 1)
    var usedPuzzle = [Bool](repeating: false, count: puzzles.count)
    var result = 0
    
    let normalizedEmptySpaces = emptySpaces.map { normalized(coordinates: $0) }
    
    for space in normalizedEmptySpaces {
        var matched = false
        
        for i in 0..<puzzles.count {
            if matched { break }
            if usedPuzzle[i] { continue }
            let puzzle = puzzles[i]
            
            if space.count != puzzle.count { continue }
            
            let basePuzzle = normalized(coordinates: puzzle)
            let onceRotationPuzzle = rotation(coordinates: basePuzzle)
            let twiceRotationPuzzle = rotation(coordinates: onceRotationPuzzle)
            let thriceRotationPuzzle = rotation(coordinates: twiceRotationPuzzle)
            
            let rotationNormalizedPuzzles = [basePuzzle, onceRotationPuzzle, twiceRotationPuzzle, thriceRotationPuzzle]
            
            for rotationPuzzle in rotationNormalizedPuzzles {
                if isSameShape(space, rotationPuzzle) {
                    result += puzzle.count
                    matched = true
                    usedPuzzle[i] = true
                    break
                }
            }
            
            
            
            
            
            
            
        }
    }
    
    
    return result
}
