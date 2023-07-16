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
    private var airConditioning: AirConditioning? = AirConditioning.mock() as? AirConditioning
    private var heater: Heater? = Heater.mock() as? Heater
    private var light: Light? = Light.mock() as? Light
    private var security: Security? = Security.mock() as? Security
    
    public let oneComponetNumber: Int = 1
    public let timerComponentsNumber: Int = 3
    
    public var tvChanelNumRows: Int {
        guard let tv = tv else { return 0 }
        return tv.maxChannel - tv.minChannel + 1
    }
    public var stereoPlaylistNumRows: Int {
        guard let stereo = stereo else { return 0 }
        return stereo.playlists.count
    }
    public var airCondPowerLevelNumRows: Int {
        guard let airConditioning = airConditioning else { return 0 }
        return airConditioning.powerLevels.count
    }
    
    public var timerHourNumRows: Int = 25
    public var timerMinuteNumRows: Int = 60
    public var timerSecondsNumRows: Int = 60
    
    public var minAirCondTemperatureValue: Float {
        guard let airConditioning = airConditioning else { return 0 }
        return airConditioning.minTemperature
    }
    public var maxAirCondTemperatureValue: Float {
        guard let airConditioning = airConditioning else { return 0 }
        return airConditioning.maxTemperatura
    }
    public var airCondTemperatureValue: String {
        guard let airConditioning = airConditioning else { return "" }
        return String(airConditioning.temperature)
    }
    
    public var minHeaterTemperatureValue: Float {
        guard let heater = heater else { return 0 }
        return heater.minTemperature
    }
    public var maxHeaterTemperatureValue: Float {
        guard let heater = heater else { return 0 }
        return heater.maxTemperatura
    }
    public var heaterTemperatureValue: String {
        guard let heater = heater else { return "" }
        return String(heater.temperature)
    }
    
    public var minStereoVolumeValue: Float {
        guard let stereo = stereo else { return 0 }
        return stereo.minVolume
    }
    public var maxStereoVolumeValue: Float {
        guard let stereo = stereo else { return 0 }
        return stereo.maxVolume
    }
    public var stereoVolumeValue: Float {
        guard let stereo = stereo else { return 0 }
        return stereo.volume
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
    
    public var minLightClarityValue: Float {
        guard let light = light else { return 0 }
        return light.minLuminosity
    }
    public var maxLightClarityValue: Float {
        guard let light = light else { return 0 }
        return light.maxLuminosity
    }
    public var lightLuminosityValue: Float {
        guard let light = light else { return 0 }
        return light.luminosity
    }
    public var tvIsOn: Bool {
        guard let tv = tv else { return false }
        return tv.isOn
    }
    public var stereoIsOn: Bool {
        guard let stereo = stereo  else { return false }
        return stereo.isOn
    }
    public var airCondIsOn: Bool {
        guard let airConditioning = airConditioning  else { return false }
        return airConditioning.isOn
    }
    public var heaterIsOn: Bool {
        guard let heater = heater  else { return false }
        return heater.isOn
    }
    public var lightIsOn: Bool {
        guard let light = light  else { return false }
        return light.isOn
    }
    public var generalSecIsOn: Bool {
        guard let security = security  else { return false }
        return security.isOn
    }
    public var alarmIsOn: Bool {
        guard let security = security  else { return false }
        return security.alarmIsON
    }
    public var camAreOn: Bool {
        guard let security = security  else { return false }
        return security.camerasAreOn
    }
    
    public var initialTVVolume: Float {
        guard let tv = tv else { return 0 }
        return tv.volume
    }
    public var initialStereoVolume: Float {
        guard let stereo = stereo else { return 0}
        return stereo.volume
    }
    public var initialArCondTemperature: Float {
        guard let airConditioning = airConditioning else { return 0 }
        return airConditioning.temperature
    }
    public var initialHeaterTemperature: Float {
        guard let heater = heater else { return 0 }
        return heater.temperature
    }
    public var initialLightClarity: Float {
        guard let light = light else { return 0}
        return light.luminosity
    }
    
    public var initialTVChannel: Int {
        guard let tv = tv else { return 0 }
        return tv.channel
    }
    
    public var initialStereoPlaylist: Int {
        guard let stereo = stereo else { return 0 }
        return stereo.selectedPlaylistIndex
    }
    
    public var initialAirCondPower: Int {
        guard let airConditioning = airConditioning else { return 0}
        return airConditioning.selectedPowerLevelIndex
    }
    
    public var heaterTimmerHour: Int {
        guard let heater = heater else { return 0 }
        return heater.hour
    }
    public var heaterTimmerMinute: Int {
        guard let heater = heater else { return 0 }
        return heater.minute
    }
    public var heaterTimmerSecond: Int {
        guard let heater = heater else { return 0 }
        return heater.second
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
    
    func titleForStereoPlaylistPicker(index: Int) -> String? {
        return stereo?.playlists[index]
        
    }
    
    func titleForTemperaturePowerPicker(index: Int) -> String? {
        return airConditioning?.powerLevels[index]
    }
    
    func titleForHeaterHoursTimerPicker(index: Int) -> String? {
        return String(index)
        
    }
    
    func titleForHeaterMinutesTimerPicker(index: Int) -> String? {
        return String(index)
    }
    
    func titleForHeaterSecondsTimerPicker(index: Int) -> String? {
        return String(index)
    }
    
    func titleForLightHoursTimerPicker(index: Int) -> String? {
        return String(index)
    }
    
    func titleForLightMinutesTimerPicker(index: Int) -> String? {
        return String(index)
    }
    
    func titleForLightSecondsTimerPicker(index: Int) -> String? {
        return String(index)
    }
    
    func didSelectTVPicker(row: Int) {
        guard let minChannel = tv?.minChannel else { return }
        tv?.channel = row + minChannel
        self.onModelUpdate?()
    }
    
    func didSelectPlaylistPicker(row: Int) {
        self.onModelUpdate?()
    }
    
    func didSelectTemperaturePicker(row: Int) {
        self.onModelUpdate?()
    }
    
    func didSelectHourPicker(row: Int) {
        self.onModelUpdate?()
    }
    
    func didSelectMinutePicker(row: Int) {
        self.onModelUpdate?()
    }
    
    func didSelectSecondPicker(row: Int) {
        self.onModelUpdate?()
    }
    
    //MARK: Sliders Values
    func didSetTVVolume(value: Float) {
        tv?.volume = value
    }
    
    func didSetStereoVolume(value: Float) {
        stereo?.volume = value
    }
    
    func didSetAirCondTemperature(value: Float) {
        airConditioning?.temperature = value
        self.onModelUpdate?()
    }
    
    func didSetHeaterTemperature(value: Float) {
        heater?.temperature = value
        self.onModelUpdate?()
    }
    
    func didSetLightLuminosity(value: Float) {
        light?.luminosity = value
    }
    
    //MARK: Switchs and Buttons
    
    public func didSwitchTVTo(value: Bool) {
        tv?.isOn = value
    }
    public func didSwitchStereoTo(value: Bool) {
        stereo?.isOn = value
    }
    public func didSwitchArCondTo(value: Bool) {
        airConditioning?.isOn = value
    }
    public func didSwitchHeaterTo(value: Bool) {
        heater?.isOn = value
    }
    public func didSwitchLightTo(value: Bool) {
        light?.isOn = value
    }
    public func didSwitchGeneralSegTo(value: Bool) {
        security?.isOn = value
    }
    public func didSwitchAlarmSegTo(value: Bool) {
            security?.alarmIsON = value
    }
    public func didSwitchCamTo(value: Bool) {
            security?.camerasAreOn = value
    }
}
