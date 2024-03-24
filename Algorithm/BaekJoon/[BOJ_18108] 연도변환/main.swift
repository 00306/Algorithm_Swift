//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 3/11/24.
//

import Foundation

guard let lunarYear = Int(readLine()!), lunarYear >= 1000, lunarYear <= 3000 else { exit(1) }
let ad = lunarYear-543

print(ad)


