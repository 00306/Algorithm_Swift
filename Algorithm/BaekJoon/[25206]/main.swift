//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 4/9/24.
//

import Foundation

var subjects: [String] = []
var credits: [Double] = []
var grades: [String] = []
var average: Double = 0.0
var pass = 0.0

func convertGradeToScore(grade: String) -> Double {
    switch grade {
    case "A+":
        return 4.5
    case "A0":
        return 4.0
    case "B+":
        return 3.5
    case "B0":
        return 3.0
    case "C+":
        return 2.5
    case "C0":
        return 2.0
    case "D+":
        return 1.5
    case "D0":
        return 1.0
    case "F":
        return 0
    default:
        return 0
    }
}

for _ in 0..<20 {
    let input = readLine()!.split(separator: " ")
    let subject = String(input[0])
    
    
    for char in subject {
        if !(char.isNumber || char.isLetter || char != " ") {
            exit(1)
        }
    }
    let credit = Double(input[1])!
    let grade = String(input[2])
    guard subject.count <= 50 && subject.count >= 1 else { exit(1) }
    guard credit == 4.0 || credit == 3.0 || credit == 2.0 || credit == 1.0 else { exit(1) }
    guard grade == "A+" || grade == "A0" || grade == "B+" || grade == "B0" || grade == "C+" || grade == "C0" || grade == "D+" || grade == "D0" || grade == "F" || grade == "P" else { exit(1) }
    if subjects.contains(subject) {
        exit(1)
    }
    
    subjects.append(subject)
    credits.append(credit)
    grades.append(grade)
}

if grades.filter({ $0 != "P" }).isEmpty {
    exit(1)
}

for i in 0..<subjects.count {
    if grades[i] == "P" {
        pass += credits[i]
        continue
    }
    let score = convertGradeToScore(grade: grades[i])
    average += score * credits[i]
}

average = average / Double(credits.reduce(0, +)-pass)
print(average)
