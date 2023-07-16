//
//  Aquecedor.swift
//  AutomatedHouseControl
//
//  Created by User on 26/5/23.
//

import Foundation

class Heater: EletronicsProtocol {
    var temperature: Float
    let minTemperature: Float
    let maxTemperatura: Float
    var hour: Int
    var minute: Int
    var second: Int
    var isOn: Bool
    
    init?(temperature: Float,
          minTemperature: Float,
          maxTemperatura: Float,
          hour: Int,
          minute: Int,
          second: Int,
          isOn: Bool) {
        self.temperature = temperature
        self.minTemperature = minTemperature
        self.maxTemperatura = maxTemperatura
        self.hour = hour
        self.minute = minute
        self.second = second
        self.isOn = isOn
        
        let isValidTemperature = temperature >= minTemperature && temperature <= maxTemperatura && temperature >= 0
        let isValidTemperatureInterval = minTemperature <= maxTemperatura
        let isValidHour = hour >= 0 && hour <= 24
        let isValidMinute = minute >= 0 && minute <= 59
        let isValidSecond = second >= 0 && second <= 59
        let isValidHeater = isValidTemperature && isValidTemperatureInterval && isValidHour && isValidMinute && isValidSecond
        
        guard isValidHeater else { return nil }
        
    }
    
    static func mock() -> EletronicsProtocol? {
        return Heater(temperature: 16, minTemperature: 16, maxTemperatura: 30, hour: 0, minute: 16, second: 1, isOn: true)
    }
}
