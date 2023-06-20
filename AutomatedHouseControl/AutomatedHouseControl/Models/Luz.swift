//
//  Luz.swift
//  AutomatedHouseControl
//
//  Created by User on 26/5/23.
//

import Foundation

class Luz: EletronicsProtocol {
    var clarity: Float
    let minClarity: Float
    let maxClarity: Float
    var hour: Int
    var minute: Int
    var second: Int
    var isOn: Bool
    
    init?(clarity: Float, minClarity: Float, maxClarity: Float, hour: Int, minute: Int, second: Int, isOn: Bool) {
        self.clarity = clarity
        self.minClarity = minClarity
        self.maxClarity = maxClarity
        self.hour = hour
        self.minute = minute
        self.second = second
        self.isOn = isOn
        
        let isValidHour = hour >= 0 && hour <= 24
        let isValidMinute = minute >= 0 && minute <= 59
        let isValidSecond = second >= 0 && second <= 59
        let isValidClarity = clarity >= minClarity && clarity <= maxClarity && clarity >= 0
        let isValidClarityInterval = minClarity <= maxClarity
        let isValidLuz = (isValidHour) && (isValidSecond) && (isValidMinute) && (isValidClarity) && (isValidClarityInterval)
        
        guard isValidLuz else { return nil }
    }
    
    
    static func mock() -> EletronicsProtocol? {
        Luz(clarity: 1.00, minClarity: 0.01, maxClarity: 1.00, hour: 0, minute: 50, second: 0, isOn: true)
    }
    
    
}
