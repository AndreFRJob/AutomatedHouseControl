//
//  Som.swift
//  AutomatedHouseControl
//
//  Created by User on 26/5/23.
//

import Foundation

class Som: EletronicsProtocol {
    var playlist: String
    
    var volume: Float
    let minVolume: Float
    let maxVolume: Float
    
    var isOn: Bool
    
    init(playlist: String, volume: Float, minVolume: Float, maxVolume: Float, isOn: Bool) {
        self.playlist = playlist
        self.volume = volume
        self.maxVolume = maxVolume
        self.minVolume = minVolume
        self.isOn = isOn
        
    }
    
    static func mock() -> EletronicsProtocol {
        return Som(playlist: "Chimarruts", volume: 0.99, minVolume: 0.01, maxVolume: 1.00, isOn: true)
    }
    
    
}
