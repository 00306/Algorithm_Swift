//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 5/15/25.
//

let T = Int(readLine()!)!
var result = ""
var seives = getPrimeSeives(till: 10000)

func getNeighbors(of number: Int) -> [Int] {
    let digits = String(number).count
    var neighbors: [Int] = []
    var power = 1
    
    for _ in 0..<digits {
        let currentDigit = (number / power) % 10
        
        for num in 0..<10 {
            if num == currentDigit { continue }
            if power == 1, num % 2 == 0 { continue }
            if power == digits, num == 0 { continue }
            let neighbor = number - currentDigit * power + num * power
            
            if neighbor < 1000 { continue }
            neighbors.append(neighbor)
        }
        
        power *= 10
    }
    
    return neighbors
}

func getPrimeSeives(till: Int) -> [Bool] {
    var seives = Array(repeating: true, count: till)
    seives[0] = false
    seives[1] = false
    
    
    for i in 2..<till {
        if seives[i] == false { continue }
        var multiplyNumber = 2
        
        while i * multiplyNumber < till {
            seives[i * multiplyNumber] = false
            multiplyNumber += 1
        }
    }
    
    seives[2] = true
    
    return seives
}

func minTransferPath(from start: Int, to end: Int) -> Int {
    var visited = Array(repeating: false, count: 10000)
    var queue: [(number: Int, path: Int)] = [(start, 0)]
    var head = 0
    
    while head < queue.count {
        let (number, path) = queue[head]
        head += 1
        if number == end { return path }
        
        let neighbors = getNeighbors(of: number)
        for neighbor in neighbors {
            if visited[neighbor] { continue }
            visited[neighbor] = true
            guard seives[neighbor] else { continue }
            
            queue.append((neighbor, path+1))
        }
    }
    
    return -1
}

for _ in 0..<T {
    let primes = readLine()!.split(separator: " ").map { Int($0)! }
    let minPath = minTransferPath(from: primes[0], to: primes[1])
    
    if minPath == -1 {
        result += "Impossible\n"
    } else {
        result += "\(minPath)\n"
    }
}

print(result)

