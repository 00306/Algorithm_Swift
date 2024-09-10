//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 9/10/24.
//

class Solution {
    func isPowerOfTwo(_ n: Int) -> Bool {
        if n == 0 { return false }
        return n & (n - 1) == 0
    }
}
