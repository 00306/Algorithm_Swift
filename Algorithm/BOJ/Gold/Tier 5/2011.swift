//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 7/18/25.
//

let password = readLine()!.map { Int(String($0))! }
var result = 0

func getPasswordCase(password: [Int]) -> Int {
    if password[0] == 0 { return 0 }
    
    var dp: [Int] = Array(repeating: 0, count: password.count + 1)
    
    dp[0] = 1
    dp[1] = 1
    
    for i in 2..<password.count + 1 {
        if password[i-1] == 0, password[i-2] == 0 { return 0 }
        if password[i-1] == 0, password[i-2] > 2 { return 0 }
        
        if password[i-1] == 0 { dp[i] = dp[i-2] }
        else if password[i-2] != 0, password[i-2] * 10 + password[i-1] <= 26 { dp[i] = (dp[i-1] + dp[i-2]) % 1000000 }
        else { dp[i] = dp[i-1] }
    }
    
    return dp[password.count] % 1000000
}

result = getPasswordCase(password: password)
print(result)
