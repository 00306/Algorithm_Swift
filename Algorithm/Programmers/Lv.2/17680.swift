//
//  17680.swift
//  Algorithm
//
//  Created by 송지혁 on 8/12/26.
//

func solution(_ cacheSize: Int, _ cities: [String]) -> Int {
    var cityCountDict: [String: Int] = [:]
    var executeTime = 0
    
    if cacheSize == 0 { return cities.count * 5 }
    
    for city in cities {
        let lowercasedCity = city.lowercased()
        if cityCountDict[lowercasedCity] == nil {
            if cityCountDict.count == cacheSize {
                let leastUsed = cityCountDict.max { $0.value < $1.value }!
                cityCountDict.removeValue(forKey: leastUsed.key)
            }
            
            cityCountDict[lowercasedCity] = 0
            executeTime += 5
        } else {
            cityCountDict[lowercasedCity]! = 0
            executeTime += 1
        }
        
        for (city, _) in cityCountDict {
            cityCountDict[city, default: 0] += 1
        }
    }
    
    return executeTime
}
