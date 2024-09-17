//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 10/21/24.
//

class Solution {
    func isIsomorphic(_ s: String, _ t: String) -> Bool {
        var sToT: [Character: Character] = [:]
        var tToS: [Character: Character] = [:]
        
        var sArray = Array(s)
        var tArray = Array(t)
        
        for i in 0..<sArray.count {
            
            if let value = sToT[sArray[i]], value != tArray[i] { return false }
            if let value = tToS[tArray[i]], value != sArray[i] { return false }
            
            sToT[sArray[i]] = tArray[i]
            tToS[tArray[i]] = sArray[i]
        }
        
        return true
    }
}
