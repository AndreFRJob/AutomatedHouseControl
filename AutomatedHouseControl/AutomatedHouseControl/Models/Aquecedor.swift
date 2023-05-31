//
//  Aquecedor.swift
//  AutomatedHouseControl
//
//  Created by User on 26/5/23.
//

import Foundation

class Aquecedor: EletronicsProtocol {
    
    
    var temperature: Float
    let minTemperature: Float
    let maxTemperatura: Float
    var hour: [Int]
    var minute: [Int]
    var second: [Int]
    var isOn: Bool
    
    init(temperature: Float, minTemperature: Float, maxTemperatura: Float, hour: [Int], minute: [Int], second: [Int], isOn: Bool) {
        self.temperature = temperature
        self.minTemperature = minTemperature
        self.maxTemperatura = maxTemperatura
        self.hour = hour
        self.minute = minute
        self.second = second
        self.isOn = isOn
    }
    
    static func mock() -> EletronicsProtocol {
        return Aquecedor(temperature: 0.35, minTemperature: 0.01, maxTemperatura: 1.00, hour: [5], minute: [16], second: [1], isOn: true)
    }
}
