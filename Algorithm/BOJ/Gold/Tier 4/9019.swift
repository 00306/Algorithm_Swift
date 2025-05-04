//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 5/4/25.
//

func operate(number: Int, code: String) -> Int {
    switch code {
        case "D": return (2 * number) % 10000
        case "S": return number-1 < 0 ? 9999 : number-1
        case "L": return (number % 1000) * 10 + number / 1000
        case "R": return (number / 10) + (number % 10) * 1000
        default: return 0
    }
}

func tracePath(path: Int) -> String {
    var path = path
    var result = ""
    
    while path > 0 {
        switch path % 10 {
            case 1: result += "D"
            case 2: result += "S"
            case 3: result += "L"
            case 4: result += "R"
            default: continue
        }
        
        path /= 10
    }
    
    return String(result.reversed())
}

func getDigit(of number: Int) -> Int {
    var currentNumber = number
    var count = 0
    
    while currentNumber >= 10 {
        currentNumber /= 10
        count += 1
    }
    
    return count
}

func findMinEqualCommandSequence(_ a: Int, _ b: Int) -> String {
    var visited = [Bool](repeating: false, count: 10000)
    var queue: [(number: Int, path: Int)] = [(a, 0)]
    var head = 0
    
    while head < queue.count {
        let state = queue[head]
        head += 1
        
        if state.number == b { return tracePath(path: state.path) }
        let candidates = [(operate(number: state.number, code: "D"), state.path * 10 + 1),
                          (operate(number: state.number, code: "S"), state.path * 10 + 2),
                          (operate(number: state.number, code: "L"), state.path * 10 + 3),
                          (operate(number: state.number, code: "R"), state.path * 10 + 4),
        ]
        
        for candidate in candidates {
            if visited[candidate.0] { continue }
            visited[candidate.0] = true
            queue.append(candidate)
        }
    }
    
    return ""
}


let T = Int(readLine()!)!
var result = ""

for _ in 0..<T {
    let AB = readLine()!.split(separator: " ").map { Int($0)! }
    let A = AB[0]
    let B = AB[1]
    result += "\(findMinEqualCommandSequence(A, B))\n"
    
}

print(result)
