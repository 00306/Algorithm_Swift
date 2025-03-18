//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 9/7/24.
//

let n = Int(readLine()!)!
var meetings: [(startTime: Int, endTime: Int, timeInterval: Int)] = []


var result = 0

for _ in 0..<n {
    let meeting = readLine()!.split(separator: " ").map { Int($0)! }
    meetings.append((meeting[0], meeting[1], meeting[1]-meeting[0]))
}

meetings.sort { startMeeting, endMeeting in
    if startMeeting.endTime == endMeeting.endTime {
        return startMeeting.startTime < endMeeting.startTime
    } else { return startMeeting.endTime < endMeeting.endTime }
}

var currentTime = meetings[0].startTime

for i in 0..<n {
    if meetings[i].startTime >= currentTime {
        result += 1
        currentTime = meetings[i].endTime
    }
}

print(result)
