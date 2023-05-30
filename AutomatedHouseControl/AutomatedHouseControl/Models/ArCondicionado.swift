//
//  ArCondicionado.swift
//  AutomatedHouseControl
//
//  Created by User on 26/5/23.
//

import Foundation

class ArCondicionado: EletronicsProtocol {
    var powerLevel: [String]
    var selectedPowerLevel: Int
    
    var temperature: Float
    let minTemperature: Float
    let maxTemperatura: Float
    var isOn: Bool
    
    init(powerLevel: [String], selectedPowerLevel: Int, temperature: Float, minTemperature: Float, maxTemperatura: Float, isOn: Bool) {
        self.powerLevel = powerLevel
        self.selectedPowerLevel = selectedPowerLevel
        self.temperature = temperature
        self.minTemperature = minTemperature
        self.maxTemperatura = maxTemperatura
        self.isOn = isOn
    }
    
    static func mock() -> EletronicsProtocol {
        return ArCondicionado(powerLevel: [Hight], selectedPowerLevel: 0, temperature: 0.80, minTemperature: 0.01, maxTemperatura: 1.00, isOn: true)
    }
    
    
}
