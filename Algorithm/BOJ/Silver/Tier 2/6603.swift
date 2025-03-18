//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 7/6/24.
//

var numbers: [[Int]] = []
var result = ""

while true {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    if input == [0] { break }
    numbers.append(Array(input[1...]))
}

func dfs(startIndex: Int, sequence: [Int], lottoNumbers: [Int]) {
    if lottoNumbers.count == 6 {
        result += "\(lottoNumbers.map { String($0) }.joined(separator: " "))\n"
        return
    }
    
    
    for i in startIndex..<sequence.count {
        dfs(startIndex: i + 1, sequence: sequence, lottoNumbers: lottoNumbers + [sequence[i]])
    }
}

for sequence in numbers {
    dfs(startIndex: 0, sequence: sequence, lottoNumbers: [])
    result += "\n"
}

print(result)
