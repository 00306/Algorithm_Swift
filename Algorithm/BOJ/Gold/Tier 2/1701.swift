//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 12/18/25.
//

let string = Array(readLine()!)
let n = string.count

var sa = Array(0..<n)
var rank = [Int](repeating: 0, count: n)

for i in 0..<n {
    let ascii = Int(string[i].asciiValue!)
    
    rank[i] = ascii
}

var t = 1

while t < n {
    
    sa.sort {
        if rank[$0] != rank[$1] { return rank[$0] < rank[$1] }
        
        let firstSuffix = ($0 + t < n) ? rank[$0 + t] : -1
        let secondSuffix = ($1 + t < n) ? rank[$1 + t] : -1
        
        return firstSuffix < secondSuffix
    }
    
    var newRank = rank
    newRank[sa[0]] = 0
    
    for i in 1..<n {
        let me = sa[i]
        let you = sa[i-1]
        
        if rank[me] != rank[you] {
            newRank[me] = newRank[you] + 1
        } else {
            let nextMe = (me + t < n) ? rank[me + t] : -1
            let nextYou = (you + t < n) ? rank[you + t] : -1
            
            if nextMe != nextYou {
                newRank[me] = newRank[you] + 1
            } else {
                newRank[me] = newRank[you]
            }
        }
    }
    
    rank = newRank
    
    if rank[sa[n-1]] == n-1 { break }
    
    t *= 2
}

var lcp = [Int](repeating: 0, count: n)
var len = 0

for i in 0..<n {
    let myRank = rank[i]
    if myRank == 0 {
        len = 0
        continue
    }
    
    let yourRank = myRank - 1
    let you = sa[yourRank]
    
    while i + len < n && you + len < n {
        if string[i + len] == string[you + len] {
            len += 1
        } else { break }
    }
     
    lcp[myRank] = len
    
    if len > 0 { len -= 1 }
    
    
}

print(lcp.max()!)
