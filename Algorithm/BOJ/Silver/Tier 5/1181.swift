//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 4/23/24.
//

Set((0..<Int(readLine()!)!)
    .map { _ in readLine()! }
)
.sorted { current, next in
    if current.count == next.count {
        return current < next
    } else {
        return current.count < next.count
    }
}
.forEach { print($0) }
