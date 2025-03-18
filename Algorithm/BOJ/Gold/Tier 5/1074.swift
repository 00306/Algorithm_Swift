//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 3/13/25.
//

import Foundation

let nrc = readLine()!.split(separator: " ").map { Int($0)! }
let n = nrc[0]
let r = nrc[1]
let c = nrc[2]

func zSearch(_ n: Int, x: Int, y: Int) -> Int {
    if x == c, y == r {
        return 1
    }
    if n == 0 { return 1 }
    
    let shift = 1 << (n-1)
    
    if c < x + shift, r < y + shift {
        return zSearch(n-1, x: x, y: y)
    } else if c >= x + shift, r < y + shift  {
        return shift * shift + zSearch(n-1, x: x + shift, y: y)
    } else if c < x + shift, r >= y + shift {
        return 2 * shift * shift + zSearch(n-1, x: x, y: y + shift)
    } else {
        return 3 * shift * shift + zSearch(n-1, x: x + shift, y: y + shift)
    }
}



print(zSearch(n, x: 0, y: 0) - 1)
