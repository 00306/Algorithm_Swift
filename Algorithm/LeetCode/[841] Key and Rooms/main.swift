//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 12/17/24.
//

class Solution {
    func canVisitAllRooms(_ rooms: [[Int]]) -> Bool {
        var lockedRooms = rooms
        var needVisitQueue = lockedRooms[0]
        var visitedQueue = Set<Int>()
        visitedQueue.update(with: 0)
        
        while !needVisitQueue.isEmpty {
            let needVisitRooms = needVisitQueue.removeFirst()
            if visitedQueue.contains(needVisitRooms) { continue }
            visitedQueue.update(with: needVisitRooms)
            
            for key in lockedRooms[needVisitRooms] {
                needVisitQueue.append(key)
                
            }
            
            
        }
        
        return visitedQueue.count == rooms.count
    }
    
    
    
}
