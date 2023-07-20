//
//  Luz.swift
//  AutomatedHouseControl
//
//  Created by User on 26/5/23.
//

import Foundation

class Light: EletronicsProtocol {
    var luminosity: Float
    let minLuminosity: Float
    let maxLuminosity: Float
    var hour: Int
    var minute: Int
    var second: Int
    var isOn: Bool
    
    init?(luminosity: Float,
          minLuminosity: Float,
          maxLuminosity: Float,
          hour: Int,
          minute: Int,
          second: Int,
          isOn: Bool) {
        self.luminosity = luminosity
        self.minLuminosity = minLuminosity
        self.maxLuminosity = maxLuminosity
        self.hour = hour
        self.minute = minute
        self.second = second
        self.isOn = isOn
        
        let isValidHour = hour >= 0 && hour <= 24
        let isValidMinute = minute >= 0 && minute <= 59
        let isValidSecond = second >= 0 && second <= 59
        let isValidLuminosity = luminosity >= minLuminosity && luminosity <= maxLuminosity && luminosity >= 0
        let isValidLuminosityInterval = minLuminosity <= maxLuminosity
        let isValidLuz = (isValidHour) && (isValidSecond) && (isValidMinute) && (isValidLuminosity) && (isValidLuminosityInterval)
        
        guard isValidLuz else { return nil }
    }
    
    static func mock() -> EletronicsProtocol? {
        Light(luminosity: 10,
              minLuminosity: 1,
              maxLuminosity: 100,
              hour: 0,
              minute: 50,
              second: 0,
              isOn: true)
    }
}
