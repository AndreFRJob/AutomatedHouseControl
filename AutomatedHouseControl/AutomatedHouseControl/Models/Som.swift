//
//  Som.swift
//  AutomatedHouseControl
//
//  Created by User on 26/5/23.
//

import Foundation

class Som: EletronicsProtocol {
    
    var playlists: [String]
    var selectedPlaylistIndex: Int
    
    var volume: Float
    let minVolume: Float
    let maxVolume: Float
    
    var isOn: Bool
    
    init(playlists: [String], selectedPlaylistIndex: Int, volume: Float, minVolume: Float, maxVolume: Float, isOn: Bool) {
        self.playlists = playlists
        self.selectedPlaylistIndex = selectedPlaylistIndex
        self.volume = volume
        self.maxVolume = maxVolume
        self.minVolume = minVolume
        self.isOn = isOn
        
    }
    
    static func mock() -> EletronicsProtocol {
        return Som(playlists: ["Chimarruts"], selectedPlaylistIndex: 0, volume: 0.85, minVolume: 0.01, maxVolume: 1.00, isOn: true)
    }
    
}

extension Som {

}
