//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 9/12/24.
//

class Solution {
    func countPrimes(_ n: Int) -> Int {
        if n <= 1 { return 0 }
        
        var sieves = Array(repeating: true, count: n)
        sieves[0] = false
        sieves[1] = false
        
        for i in 2..<n where sieves[i] {
            var index = 2
            
            while i * index < n {
                sieves[i * index] = false
                index += 1
            }
        }
        
        return sieves.filter { $0 }.count
    }
}
