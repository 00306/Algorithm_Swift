//
//  17683.swift
//  Algorithm
//
//  Created by 송지혁 on 8/11/26.
//

func isContainMelody(full: String, melody: String) -> Bool {
    let fullArray = full.map { String($0) }
    let melodyArray = melody.map { String($0) }
    
    for i in 0..<fullArray.count where fullArray[i] == melodyArray[0] {
        var j = 1
        
        while i+j < fullArray.count, j < melodyArray.count {
            if fullArray[i+j] != melodyArray[j] { break }
            j += 1
        }
        
        if j == melodyArray.count { return true }
    }
    
    return false
}

func fullMelody(sheet: String, minute: Int) -> String {
    let sheetArray = sheet.map { String($0) }
    var melody = ""
    var count = minute
    var i = 0
    
    while count > 0 {
        if i >= sheetArray.count { i = 0 }
        melody += sheetArray[i]
        
        
        i += 1
        count -= 1
    }
    
    print(melody)
    return melody
}

func timeToMinute(start: String, end: String) -> Int {
    let startArray = start.split(separator: ":").map { String($0) }
    let endArray = end.split(separator: ":").map { String($0) }
    
    let startHour = startArray[0]
    let startMinute = startArray[1]
    
    let endHour = endArray[0]
    let endMinute = endArray[1]
    
    
    return (Int(endHour)! - Int(startHour)!) * 60 + Int(endMinute)! - Int(startMinute)!
}

func solution(_ m: String, _ musicinfos: [String]) -> String {
    var resultTitle = "(None)"
    var resultMinute = 0
    
    for info in musicinfos {
        let infoArray = info.split(separator: ",").map { String($0) }
        let startTimeString = infoArray[0]
        let endTimeString = infoArray[1]
        let title = infoArray[2]
        let sheet = infoArray[3]
        
        let minute = timeToMinute(start: startTimeString, end: endTimeString)
        
        var convertedSheet = ""
        let sheetArray = sheet.map { String($0) }
        
        for i in 0..<sheetArray.count {
            if sheetArray[i] == "#" {
                convertedSheet.removeLast()
                convertedSheet += String(Character(sheetArray[i-1]).lowercased())
            } else {
                convertedSheet += sheetArray[i]
            }
        }
        
        let fullMelody = fullMelody(sheet: convertedSheet, minute: minute)
        
        var convertedMelody = ""
        let melodyArray = m.map { String($0) }
        
        for i in 0..<melodyArray.count {
            if melodyArray[i] == "#" {
                convertedMelody.removeLast()
                convertedMelody += String(Character(melodyArray[i-1]).lowercased())
            } else {
                convertedMelody += melodyArray[i]
            }
        }
        
        if isContainMelody(full: fullMelody, melody: convertedMelody) {
            if minute > resultMinute {
                resultTitle = title
                resultMinute = minute
            }
        }
    }
    
    return resultTitle
}
