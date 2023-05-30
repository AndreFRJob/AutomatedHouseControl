//
//  AHCMainViewModel.swift
//  AutomatedHouseControl
//
//  Created by User on 28/4/23.
//

import Foundation

class AHCMainViewModel {
    
    private var som: Som = Som.mock() as! Som
    private var tv: TV = TV.mock() as! TV
    private var arCondicionado: ArCondicionado = ArCondicionado.mock() as! ArCondicionado
    private var aquecedor: Aquecedor = Aquecedor.mock() as! Aquecedor
    
    public let oneComponetNumber: Int = 1
    public let timerComponentsNumber: Int = 3
    
    public var tvChanelNumRows: Int = 10
    public var somPlaylistNumRows: Int = 10
    public var temperatureNumRows: Int = 21
    public var timerHourNumRows: Int = 100
    public var timerMinuteNumRows: Int = 60
    public var timerSecondsNumRows: Int = 60
    
    // Mark: Actions
    func titleForTVChanelPicker(index: Int) -> Int? {
        return tv.channel[index]
    }
    
    func titleForSomPlaylistPicker(index: Int) -> String? {
        return som.playlists[index]
        
    }
    
    func titleForTemperaturePowerPicker(index: Int) -> String? {
        return arCondicionado.powerLevel[index]
    }
    
    func titleForHourTimerPicker(index: Int) -> Int? {
        return ""
    }
    
    func titleForMinuteTimerPicker(index: Int) -> Int? {
        return ""
    }
    
    func titleForSecondTimerPicker(index: Int) -> Int? {
        return ""
    }
    
    func didSelectTVPicker(row: Int) {
        
    }
    
    func didSelectPlaylistPicker(row: Int) {
        
    }
    
    func didSelectTemperaturePicker(row: Int) {
        
    }
    
    func didSelectHourPicker(row: Int) {
        
    }
    
    func didSelectMinutePicker(row: Int) {
        
    }
    
    func didSelectSecondPicker(row: Int) {
        
    }
    
    
}
