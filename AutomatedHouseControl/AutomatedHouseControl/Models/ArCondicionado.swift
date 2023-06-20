//
//  ArCondicionado.swift
//  AutomatedHouseControl
//
//  Created by User on 26/5/23.
//

import Foundation

class ArCondicionado: EletronicsProtocol {
    var powerLevels: [String]
    var selectedPowerLevelIndex: Int
    
    var temperature: Float
    let minTemperature: Float
    let maxTemperatura: Float
    var isOn: Bool
    
    init?(powerLevel: [String], temperature: Float, minTemperature: Float, maxTemperatura: Float, isOn: Bool, selectedPowerLevelIndex: Int) {
        self.powerLevels = powerLevel
        self.temperature = temperature
        self.minTemperature = minTemperature
        self.maxTemperatura = maxTemperatura
        self.isOn = isOn
        self.selectedPowerLevelIndex = selectedPowerLevelIndex
        
        let isValidTemperature = temperature >= minTemperature && temperature <= maxTemperatura && temperature >= 0
        let isValidTemperatureInterval = minTemperature <= maxTemperatura
        let isValidArCondicionado = (isValidTemperature) && (isValidTemperatureInterval)
        
        guard isValidArCondicionado else { return nil }
        
    }
    
    static func mock() -> EletronicsProtocol? {
        return ArCondicionado(powerLevel: ["Hight", "Medium", "Low"], temperature: 0.80, minTemperature: 0.01, maxTemperatura: 1.00, isOn: true, selectedPowerLevelIndex: 0)
    }
    
    
}
