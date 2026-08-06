//
//  17686.swift
//  Algorithm
//
//  Created by 송지혁 on 8/6/26.
//

func seperateFile(file: String) -> (String, String, String) {
    let fileArray = file.map { String($0) }
    var numberStartIndex = 0
    var numberEndIndex = 0
    
    for i in 0..<fileArray.count {
        if numberEndIndex - numberStartIndex == 4 { break }
        
        if Character(fileArray[i]).isNumber {
            if numberStartIndex == 0 {
                numberStartIndex = i
                numberEndIndex = i
            } else {
                numberEndIndex = i
            }
        } else if numberStartIndex != 0 { break }
    }
    
    let head = fileArray[..<numberStartIndex].joined()
    let number = fileArray[numberStartIndex...numberEndIndex].joined()
    
    var tail = ""
    
    if numberEndIndex + 1 < fileArray.count {
        tail = fileArray[(numberEndIndex+1)...].joined()
    }
    
    return (head, number, tail)
}

func solution(_ files: [String]) -> [String] {
    var seperated = files.map { seperateFile(file: $0) }
    
    seperated.sort {
        if $0.0.uppercased() == $1.0.uppercased() {
            return Int($0.1)! < Int($1.1)!
        }
        
        return $0.0.uppercased() < $1.0.uppercased()
    }
    
    var result: [String] = []
    
    for file in seperated {
        let (head, number, tail) = file
        
        result.append(head+number+tail)
    }
    
    return result
}
