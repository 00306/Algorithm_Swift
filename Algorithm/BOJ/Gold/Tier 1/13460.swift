//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 5/10/25.
//

enum TiltDirection: CaseIterable {
    case top
    case down
    case left
    case right
    
    var direction: (Int, Int) {
        switch self {
            case .top: return (-1, 0)
            case .down: return (1, 0)
            case .left: return (0, -1)
            case .right: return (0, 1)
        }
    }
}

let NM = readLine()!.split(separator: " ").map { Int($0)! }
let N = NM[0]
let M = NM[1]

var graph: [[Character]] = []
var redBall = (0, 0, 0)
var blueBall = (0, 0, 0)
var hole = (0, 0)

for i in 0..<N {
    let line = readLine()!.map { $0 }
    
    for (j, char) in line.enumerated() {
        if char == "R" { redBall = (i, j, 0) }
        if char == "B" { blueBall = (i, j, 0) }
        if char == "O" { hole = (i, j) }
    }
    
    graph.append(line)
}
graph[redBall.0][redBall.1] = "."
graph[blueBall.0][blueBall.1] = "."

func bfs() -> Int {
    
    var queue: [[(Int, Int, Int)]] = [[redBall, blueBall]]
    var visited: [[(Int, Int)]] = [[(redBall.0, redBall.1), (blueBall.0, blueBall.1)]]
    var head = 0
    
    func move(ball: (Int, Int, Int), to direction: TiltDirection, another: (Int, Int, Int)) -> (Int, Int, Int) {
        let next = (ball.0 + direction.direction.0, ball.1 + direction.direction.1, ball.2)
        if graph[next.0][next.1] == "O" { return next }
        if graph[next.0][next.1] == "#" || next == another { return ball }
        
        
        return move(ball: next, to: direction, another: another)
    }
    
    func tilt(to direction: TiltDirection, elements: [(Int, Int, Int)]) -> [(Int, Int, Int)] {
        var nextRedBall = elements[0]
        var nextBlueBall = elements[1]
        
        switch direction {
            case .top:
                if nextRedBall.0 < nextBlueBall.0 {
                    nextRedBall = move(ball: nextRedBall, to: .top, another: nextBlueBall)
                    nextBlueBall = move(ball: nextBlueBall, to: .top, another: nextRedBall)
                } else {
                    nextBlueBall = move(ball: nextBlueBall, to: .top, another: nextRedBall)
                    nextRedBall = move(ball: nextRedBall, to: .top, another: nextBlueBall)
                }
                
                
            case .down:
                if nextRedBall.0 < nextBlueBall.0 {
                    nextBlueBall = move(ball: nextBlueBall, to: .down, another: nextRedBall)
                    nextRedBall = move(ball: nextRedBall, to: .down, another: nextBlueBall)
                } else {
                    nextRedBall = move(ball: nextRedBall, to: .down, another: nextBlueBall)
                    nextBlueBall = move(ball: nextBlueBall, to: .down, another: nextRedBall)
                }
                
            case .left:
                if nextRedBall.1 < nextBlueBall.1 {
                    nextRedBall = move(ball: nextRedBall, to: .left, another: nextBlueBall)
                    nextBlueBall = move(ball: nextBlueBall, to: .left, another: nextRedBall)
                    
                } else {
                    nextBlueBall = move(ball: nextBlueBall, to: .left, another: nextRedBall)
                    nextRedBall = move(ball: nextRedBall, to: .left, another: nextBlueBall)
                }
                
            case .right:
                if nextRedBall.1 < nextBlueBall.1 {
                    nextBlueBall = move(ball: nextBlueBall, to: .right, another: nextRedBall)
                    nextRedBall = move(ball: nextRedBall, to: .right, another: nextBlueBall)
                } else {
                    nextRedBall = move(ball: nextRedBall, to: .right, another: nextBlueBall)
                    nextBlueBall = move(ball: nextBlueBall, to: .right, another: nextRedBall)
                }
        }
        
        nextRedBall.2 += 1
        nextBlueBall.2 += 1
        
        return [nextRedBall, nextBlueBall]
    }
    
    while head < queue.count {
        let element = queue[head]
        head += 1
        if element[0].2 >= 10 { break }
        
        for direction in TiltDirection.allCases {
            let nextCoordinate = tilt(to: direction, elements: element)
            let nextRedBall = nextCoordinate[0]
            let nextBlueBall = nextCoordinate[1]
            
            if visited.contains(where: { $0[0] == (nextRedBall.0, nextRedBall.1) && $0[1] == (nextBlueBall.0, nextBlueBall.1) }) { continue }
            
            visited.append([(nextCoordinate[0].0, nextCoordinate[0].1),
                            (nextCoordinate[1].0, nextCoordinate[1].1)])
            
            if nextBlueBall.0 == hole.0 && nextBlueBall.1 == hole.1 { continue }
            if nextRedBall.0 == hole.0 && nextRedBall.1 == hole.1 { return nextRedBall.2 }
            
            queue.append([nextRedBall, nextBlueBall])
        }
    }
    
    return -1
}

print(bfs())
