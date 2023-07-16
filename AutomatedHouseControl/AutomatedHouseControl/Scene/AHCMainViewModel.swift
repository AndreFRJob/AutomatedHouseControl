//
//  AHCMainViewModel.swift
//  AutomatedHouseControl
//
//  Created by User on 28/4/23.
//

import Foundation

class AHCMainViewModel {
    
    // MARK: Atributes
    private var stereo: Stereo? = Stereo.mock() as? Stereo
    private var tv: TV? = TV.mock() as? TV
    private var arCondicionado: AirConditioning? = AirConditioning.mock() as? AirConditioning
    private var heater: Heater? = Heater.mock() as? Heater
    private var luz: Light? = Light.mock() as? Light
    private var seg: Security? = Security.mock() as? Security
    
    public let oneComponetNumber: Int = 1
    public let timerComponentsNumber: Int = 3
    
    public var tvChanelNumRows: Int {
        guard let tv = tv else { return 0 }
        return tv.maxChannel - tv.minChannel + 1
    }
    public var somPlaylistNumRows: Int {
        guard let som = stereo else { return 0 }
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
    public var arCondTemperatureValue: String {
        guard let arCondicionado = arCondicionado else { return "" }
        return String(arCondicionado.temperature)
    }
    
    public var minAquecTemperatureValue: Float {
        guard let aquecedor = heater else { return 0 }
        return aquecedor.minTemperature
    }
    public var maxAquecTemperatureValue: Float {
        guard let aquecedor = heater else { return 0 }
        return aquecedor.maxTemperatura
    }
    public var aquecTemperatureValue: String {
        guard let aquecedor = heater else { return "" }
        return String(aquecedor.temperature)
    }
    
    public var minSomVolumeValue: Float {
        guard let som = stereo else { return 0 }
        return som.minVolume
    }
    public var maxSomVolumeValue: Float {
        guard let som = stereo else { return 0 }
        return som.maxVolume
    }
    public var somVolumeValue: Float {
        guard let som = stereo else { return 0 }
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
        return luz.minLuminosity
    }
    public var maxLuzClarityValue: Float {
        guard let luz = luz else { return 0 }
        return luz.maxLuminosity
    }
    public var luzClarityValue: Float {
        guard let luz = luz else { return 0 }
        return luz.luminosity
    }
    public var tvIsOn: Bool {
        guard let tv = tv else { return false }
        return tv.isOn
    }
    public var stereoIsOn: Bool {
        guard let som = stereo  else { return false }
        return som.isOn
    }
    public var arCondIsOn: Bool {
        guard let arCondicionado = arCondicionado  else { return false }
        return arCondicionado.isOn
    }
    public var heaterIsOn: Bool {
        guard let aquecedor = heater  else { return false }
        return aquecedor.isOn
    }
    public var lightIsOn: Bool {
        guard let luz = luz  else { return false }
        return luz.isOn
    }
    public var generalSegIsOn: Bool {
        guard let seg = seg  else { return false }
        return seg.isOn
    }
    public var alarmIsOn: Bool {
        guard let seg = seg  else { return false }
        return seg.alarmIsON
    }
    public var camAreOn: Bool {
        guard let seg = seg  else { return false }
        return seg.camerasAreOn
    }
    
    public var initialTVVolume: Float {
        guard let tv = tv else { return 0 }
        return tv.volume
    }
    public var initialStereoVolume: Float {
        guard let som = stereo else { return 0}
        return som.volume
    }
    public var initialArCondTemperature: Float {
        guard let arCondicionado = arCondicionado else { return 0 }
        return arCondicionado.temperature
    }
    public var initialHeaterTemperature: Float {
        guard let aquecedor = heater else { return 0 }
        return aquecedor.temperature
    }
    public var initialLightClarity: Float {
        guard let luz = luz else { return 0}
        return luz.luminosity
    }
    
    public var initialTVChannel: Int {
        guard let tv = tv else { return 0 }
        return tv.channel
    }
    
    public var initialStereoPlaylist: Int {
        guard let som = stereo else { return 0 }
        return som.selectedPlaylistIndex
    }
    
    public var initialArCondPower: Int {
        guard let arCondicionado = arCondicionado else { return 0}
        return arCondicionado.selectedPowerLevelIndex
    }
    
    public var heaterTimmerHour: Int {
        guard let aquecedor = heater else { return 0 }
        return aquecedor.hour
    }
    public var heaterTimmerMinute: Int {
        guard let aquecedor = heater else { return 0 }
        return aquecedor.minute
    }
    public var heaterTimmerSecond: Int {
        guard let aquecedor = heater else { return 0 }
        return aquecedor.second
    }
    
    
    
    //MARK: Reactors
    var onModelUpdate: (() -> ())?
    
    // MARK: Helpers
    func titleForTVChanelPicker(index: Int) -> String? {
        guard let minChannel = tv?.minChannel else {
            return "Canais nao encontrados"
        }
        return String(index + minChannel)
    }
    
    func titleForSomPlaylistPicker(index: Int) -> String? {
        return stereo?.playlists[index]
        
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
        stereo?.volume = value
    }
    
    func didSetArCondTemperature(value: Float) {
        arCondicionado?.temperature = value
        self.onModelUpdate?()
    }
    
    func didSetHeaterTemperature(value: Float) {
        heater?.temperature = value
        self.onModelUpdate?()
    }
    
    func didSetLightClarity(value: Float) {
        luz?.luminosity = value
    }
    
    //MARK: Switchs and Buttons
    
    public func didSwitchTVTo(value: Bool) {
        tv?.isOn = value
    }
    public func didSwitchStereoTo(value: Bool) {
        stereo?.isOn = value
    }
    public func didSwitchArCondTo(value: Bool) {
        arCondicionado?.isOn = value
    }
    public func didSwitchHeaterTo(value: Bool) {
        heater?.isOn = value
    }
    public func didSwitchLightTo(value: Bool) {
        luz?.isOn = value
    }
    public func didSwitchGeneralSegTo(value: Bool) {
        seg?.isOn = value
    }
    public func didSwitchAlarmSegTo(value: Bool) {
            seg?.alarmIsON = value
    }
    public func didSwitchCamTo(value: Bool) {
            seg?.camerasAreOn = value
    }
}


    /*
     areaA1TVOnOffSwitch
     areaA2SomOnOffSwitch
     areaB1ArCondOnOffSwitch
     areaB2AquecedorOnOffSwitch
     areaC1LuzOnOffSwitch
     areaC2SegurancaGeneralOnOffSwitch
     areaC2AlarmOnOffSwitch
     areaC2CamerasOnOffSwitch
     */
