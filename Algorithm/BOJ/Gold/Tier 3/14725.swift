//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 11/11/25.
//

let N = Int(readLine()!)!
let line = "--"
var routes: [[String]] = []
var result = ""

for _ in 0..<N {
    let route = readLine()!.split(separator: " ").map { String($0) }[1...]
    routes.append(Array(route))
}

routes.sort(by: { $0.joined() < $1.joined() })

var prevRoute: [String] = []

for route in routes {
    if prevRoute.count == 0 {
        for (index, element) in route.enumerated() {
            result += "\(String(repeating: line, count: index))\(element)\n"
        }
        
        prevRoute = route
        continue
    }
    
    for i in 0..<min(route.count, prevRoute.count) {
        if route[i] == prevRoute[i] { continue }
        
        for j in i..<route.endIndex {
            result += "\(String(repeating: line, count: j))\(route[j])\n"
        }
        
        prevRoute = route
        break
    }
}

print(result)
