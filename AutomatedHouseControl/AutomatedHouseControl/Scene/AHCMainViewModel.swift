//
//  AHCMainViewModel.swift
//  AutomatedHouseControl
//
//  Created by User on 28/4/23.
//

import Foundation

class AHCMainViewModel {
    
    public let oneComponetNumber: Int = 1
    public let timerComponentsNumber: Int = 3
    
    public var tvChanelNumRows: Int = 10
    public var somPlaylistNumRows: Int = 10
    public var temperatureNumRows: Int = 21
    public var timerHourNumRows: Int = 100
    public var timerMinuteNumRows: Int = 60
    public var timerSecondsNumRows: Int = 60
    
    // Mark: Actions
    func titleForTVChanelPicker(index: Int) -> String? {
        return ""
    }
    
    func titleForSomPlaylistPicker(index: Int) -> String? {
        return ""
    }
    
    func titleForTemperaturePowerPicker(index: Int) -> String? {
        return ""
    }
    
    func titleForHourTimerPicker(index: Int) -> String? {
        return ""
    }
    
    func titleForMinuteTimerPicker(index: Int) -> String? {
        return ""
    }
    
    func titleForSecondTimerPicker(index: Int) -> String? {
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
