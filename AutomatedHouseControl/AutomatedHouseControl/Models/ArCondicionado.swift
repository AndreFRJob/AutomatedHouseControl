//
//  ArCondicionado.swift
//  AutomatedHouseControl
//
//  Created by User on 26/5/23.
//

import Foundation

class ArCondicionado: EletronicsProtocol {
    var powerLevel: String
    var temperature: Float
    let minTemperature: Float
    let maxTemperatura: Float
    var isOn: Bool
    
    init(powerLevel: String, temperature: Float, minTemperature: Float, maxTemperatura: Float, isOn: Bool) {
        self.powerLevel = powerLevel
        self.temperature = temperature
        self.minTemperature = minTemperature
        self.maxTemperatura = maxTemperatura
        self.isOn = isOn
    }
    
    static func mock() -> EletronicsProtocol {
        return ArCondicionado(powerLevel: "Low", temperature: 0.85, minTemperature: 0.00, maxTemperatura: 1.00, isOn: True)
    }
    
    
}
