//
//  Som.swift
//  AutomatedHouseControl
//
//  Created by User on 26/5/23.
//

import Foundation

class Som: EletronicsProtocol {
    
    let playlists: [String]
    
    var selectedPlaylistIndex: Int
    
    var volume: Float
    let minVolume: Float
    let maxVolume: Float
    
    var isOn: Bool
    
    init?(playlists: [String], selectedPlaylistIndex: Int, volume: Float, minVolume: Float, maxVolume: Float, isOn: Bool) {
        self.selectedPlaylistIndex = selectedPlaylistIndex
        self.volume = volume
        self.maxVolume = maxVolume
        self.minVolume = minVolume
        self.isOn = isOn
        self.playlists = playlists
        
        let isValidSelectedPlaylistIndex = selectedPlaylistIndex >= 0 && selectedPlaylistIndex <= playlists.count
        let isValidVolume = volume >= minVolume && volume <= maxVolume && volume >= 0
        let isValidVolumeInterval = minVolume <= maxVolume
        let isValidSom = (isValidVolume) && (isValidSelectedPlaylistIndex) && (isValidVolumeInterval)
        
        guard isValidSom else { return nil }
        
        
    }
    
    static func mock() -> EletronicsProtocol? {
        return Som(playlists: ["Chimarruts", "Nego do Borel", "Supla", "1berto", "Caitano"] ,selectedPlaylistIndex: 1, volume: 20, minVolume: 0, maxVolume: 100, isOn: true)
    }
    
}
