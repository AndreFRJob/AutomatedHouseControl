//
//  Tv.swift
//  AutomatedHouseControl
//
//  Created by User on 24/5/23.
//

import Foundation

class TV: EletronicsProtocol {
    var channel: [Int]
    let minChannel: Int
    let maxChannel: Int
    
    var volume: Float
    let minVolume: Float
    let maxVolume: Float
    
    var isOn: Bool
    
    init(channel: [Int], minChannel: Int, maxChannel: Int, volume: Float, minVolume: Float, maxVolume: Float, isOn: Bool) {
        self.channel = channel
        self.minChannel = minChannel
        self.maxChannel = maxChannel
        self.volume = volume
        self.minVolume = minVolume
        self.maxVolume = maxVolume
        self.isOn = isOn
    }
    
    static func mock() -> EletronicsProtocol {
        return TV(channel: [3], minChannel: 1, maxChannel: 10, volume: 0.92, minVolume: 0.01, maxVolume: 1.00, isOn: true)
    }
}
