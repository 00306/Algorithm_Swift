//
//  49993.swift
//  Algorithm
//
//  Created by 송지혁 on 8/2/26.
//

import Foundation

func isValidSkillTree(_ skillMap: [String: Int], _ skillTree: String) -> Bool {
    let skillTreeArray = skillTree.map { String($0) }
    var currentOrder = -1
    
    for skill in skillTreeArray {
        guard let order = skillMap[skill] else { continue }
        if order - currentOrder != 1 { return false }
        currentOrder += 1
    }
    
    return true
}

func solution(_ skill: String, _ skill_trees: [String]) -> Int {
    let skillArray = skill.map { String($0) }
    var result = 0
    var skillMap: [String: Int] = [:]
    
    for i in 0..<skillArray.count {
        skillMap[skillArray[i]] = i
    }
    
    for skillTree in skill_trees {
        if isValidSkillTree(skillMap, skillTree) { result += 1 }
    }
    
    return result
}
