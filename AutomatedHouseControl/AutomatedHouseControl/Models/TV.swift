//
//  Tv.swift
//  AutomatedHouseControl
//
//  Created by User on 24/5/23.
//

import Foundation

class TV: EletronicsProtocol {
    var channel: Int
    let minChannel: Int
    let maxChannel: Int
    
    var volume: Float
    let minVolume: Float
    let maxVolume: Float
    
    var isOn: Bool
    
    init?(channel: Int,
          minChannel: Int,
          maxChannel: Int,
          volume: Float,
          minVolume: Float,
          maxVolume: Float,
          isOn: Bool) {
        self.channel = channel
        self.minChannel = minChannel
        self.maxChannel = maxChannel
        self.volume = volume
        self.minVolume = minVolume
        self.maxVolume = maxVolume
        self.isOn = isOn
        
        let isValidChannelInterval = minChannel <= maxChannel
        let isValidChannel = channel >= minChannel && channel <= maxChannel
        let isValidVolumeInterval = minVolume <= maxVolume
        let isValidVolume = volume >= minVolume && volume <= maxVolume
        let isValidTV = (isValidChannelInterval) &&
        (isValidChannel) &&
        (isValidVolumeInterval) &&
        (isValidVolume)
        
        guard isValidTV else { return nil }
    }
    
    static func mock() -> EletronicsProtocol? {
        return TV(channel: 6 ,
                  minChannel: 1,
                  maxChannel: 10,
                  volume: 92,
                  minVolume: 0,
                  maxVolume: 100,
                  isOn: true)
    }
}
