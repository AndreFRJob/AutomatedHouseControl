//
//  AHCMainViewModel.swift
//  AutomatedHouseControl
//
//  Created by User on 28/4/23.
//

import Foundation

class AHCMainViewModel {
    
    // MARK: Atributes
    private var som: Som? = Som.mock() as? Som
    private var tv: TV? = TV.mock() as? TV
    private var arCondicionado: ArCondicionado? = ArCondicionado.mock() as? ArCondicionado
    private var aquecedor: Aquecedor? = Aquecedor.mock() as? Aquecedor
    private var luz: Luz? = Luz.mock() as? Luz
    
    public let oneComponetNumber: Int = 1
    public let timerComponentsNumber: Int = 3
    
    public var tvChanelNumRows: Int {
        guard let tv = tv else { return 0 }
        return tv.maxChannel - tv.minChannel + 1
    }
    public var somPlaylistNumRows: Int {
        guard let som = som else { return 0 }
        return som.playlists.count
    }
    public var arCondPowerLevelNumRows: Int {
        guard let arCondicionado = arCondicionado else { return 0 }
        return arCondicionado.powerLevels.count
    }
    
    public var timerHourNumRows: Int = 25
    public var timerMinuteNumRows: Int = 60
    public var timerSecondsNumRows: Int = 60
    
    // MARK: Helpers
    func titleForTVChanelPicker(index: Int) -> String? {
        guard let minChannel = tv?.minChannel else {
            return "Canais nao encontrados"
        }
        return String(index + minChannel)
    }
    
    func titleForSomPlaylistPicker(index: Int) -> String? {
        return som?.playlists[index]
        
    }
    
    func titleForTemperaturePowerPicker(index: Int) -> String? {
        return arCondicionado?.powerLevels[index]
    }
    
    func titleForHoursAquecedorTimerPicker(index: Int) -> String? {
        return String(index)
        
    }
    
    func titleForMinutesAquecedorTimerPicker(index: Int) -> String? {
        return String(index)
    }
    
    func titleForSecondsAquecedorTimerPicker(index: Int) -> String? {
        return String(index)
    }
    
    func titleForHoursLuzTimerPicker(index: Int) -> String? {
        return String(index)
    }
    
    func titleForMinutesLuzTimerPicker(index: Int) -> String? {
        return String(index)
    }
    
    func titleForSecondsLuzTimerPicker(index: Int) -> String? {
        return String(index)
    }
    
    func didSelectTVPicker(row: Int) {
        guard let minChannel = tv?.minChannel else { return }
        tv?.channel = row + minChannel
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
