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
    
    public var minArCondTemperatureValue: Float {
        guard let arCondicionado = arCondicionado else { return 0 }
        return arCondicionado.minTemperature
    }
    public var maxArCondTemperatureValue: Float {
        guard let arCondicionado = arCondicionado else { return 0 }
        return arCondicionado.maxTemperatura
    }
    public var arCondTemperatureValue: Float {
        guard let arCondicionado = arCondicionado else { return 0 }
        return arCondicionado.temperature
    }
    
    public var minAquecTemperatureValue: Float {
        guard let aquecedor = aquecedor else { return 0 }
        return aquecedor.minTemperature
    }
    public var maxAquecTemperatureValue: Float {
        guard let aquecedor = aquecedor else { return 0 }
        return aquecedor.maxTemperatura
    }
    public var aquecTemperatureValue: Float {
        guard let aquecedor = aquecedor else { return 0 }
        return aquecedor.temperature
    }
    
    public var minSomVolumeValue: Float {
        guard let som = som else { return 0 }
        return som.minVolume
    }
    public var maxSomVolumeValue: Float {
        guard let som = som else { return 0 }
        return som.maxVolume
    }
    public var somVolumeValue: Float {
        guard let som = som else { return 0 }
        return som.volume
    }
    
    public var minTVVolumeValue: Float {
        guard let tv = tv else { return 0 }
        return tv.minVolume
    }
    public var maxTVVolumeValue: Float {
        guard let tv = tv else { return 0 }
        return tv.maxVolume
    }
    public var tvVolumeValue: Float {
        guard let tv = tv else { return 0 }
        return tv.volume
    }
    
    public var minLuzClarityValue: Float {
        guard let luz = luz else { return 0 }
        return luz.minClarity
    }
    public var maxLuzClarityValue: Float {
        guard let luz = luz else { return 0 }
        return luz.maxClarity
    }
    public var luzClarityValue: Float {
        guard let luz = luz else { return 0 }
        return luz.clarity
    }
    
    
    
    
    
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
    
//MARK: Sliders Values
    func didSetTVVolume(value: Float) {
        tv?.volume = value
    }
    
    func didSetStereoVolume(value: Float) {
        som?.volume = value
    }
    
    func didSetArCondTemperature(value: Float) {
        arCondicionado?.temperature = value
    }
    
    func didSetHeaterTemperature(value: Float) {
        aquecedor?.temperature = value
    }
    
    func didSetLightClarity(value: Float) {
        luz?.clarity = value
    }
    
    
}
