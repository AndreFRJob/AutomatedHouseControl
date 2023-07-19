//
//  ViewController.swift
//  AutomatedHouseControl
//
//  Created by User on 26/4/23.
//

import UIKit

class AHCMainViewController: UIViewController {
    
    var viewModel: AHCMainViewModel = .init()
    
    @IBOutlet weak var generalAButton: UIButton!
    @IBOutlet weak var generalATitleLabel: UILabel!
    
    @IBOutlet weak var generalBButton: UIButton!
    @IBOutlet weak var generalBTitleLabel: UILabel!
    
    @IBOutlet weak var generalCButton: UIButton!
    @IBOutlet weak var generalCTitleLabel: UILabel!
    
    @IBOutlet weak var allGeneralButton: UIButton!
    
    @IBOutlet weak var a1TVOnOffSwitch: UISwitch!
    @IBOutlet weak var a1TVTitleLabel: UILabel!
    @IBOutlet weak var a1TVChooseChanelPickerView: UIPickerView!
    @IBOutlet weak var a1TVChooseChanelTitleLabel: UILabel!
    @IBOutlet weak var a1TVVolumeTitleLabel: UILabel!
    @IBOutlet weak var a1TVVolumeSlider: UISlider!
    
    @IBOutlet weak var a2StereoOnOffSwitch: UISwitch!
    @IBOutlet weak var a2StereoTitleLabel: UILabel!
    @IBOutlet weak var a2StereoChoosePlaylistPickerView: UIPickerView!
    @IBOutlet weak var a2StereoChoosePlaylistLabel: UILabel!
    @IBOutlet weak var a2StereoVolumeTitleLabel: UILabel!
    @IBOutlet weak var a2StereoVolumeSlider: UISlider!
    
    @IBOutlet weak var b1AirCondTitleLabel: UILabel!
    @IBOutlet weak var b1AirCondOnOffSwitch: UISwitch!
    @IBOutlet weak var b1AirCondTemperatureTitleLabel: UILabel!
    @IBOutlet weak var b1AirCondTemperatureSlider: UISlider!
    @IBOutlet weak var b1AirCondTemperatureCMarkLabel: UILabel!
    @IBOutlet weak var b1AirCondTemperatureQuantityLabel: UILabel!
    @IBOutlet weak var b1AirCondPowerTitleLabel: UILabel!
    @IBOutlet weak var b1AirCondTemperatureChoosePowerPickerView: UIPickerView!
    
    @IBOutlet weak var b2HeaterTitleLabel: UILabel!
    @IBOutlet weak var b2HeaterOnOffSwitch: UISwitch!
    @IBOutlet weak var b2HeaterTemperatureTitleLabel: UILabel!
    @IBOutlet weak var b2HeaterTemperatureSlider: UISlider!
    @IBOutlet weak var b2HeaterTemperatureCMarkLabel: UILabel!
    @IBOutlet weak var b2HeaterTemperatureQuantityLabel: UILabel!
    @IBOutlet weak var b2HeaterTimerTitleLabel: UILabel!
    @IBOutlet weak var b2HeaterTimerChoosePickerView: UIPickerView!
    
    @IBOutlet weak var c1LightTitleLabel: UILabel!
    @IBOutlet weak var c1LightOnOffSwitch: UISwitch!
    @IBOutlet weak var c1LightLuminosityTitleLabel: UILabel!
    @IBOutlet weak var c1LightLuminositySlider: UISlider!
    @IBOutlet weak var c1LightTimerTitleLabel: UILabel!
    @IBOutlet weak var c1LightTimerChoosePickerView: UIPickerView!
    
    @IBOutlet weak var c2SecurityTitleLabel: UILabel!
    @IBOutlet weak var c2SecurityGeneralOnOffSwitch: UISwitch!
    @IBOutlet weak var c2AlarmTitleLabel: UILabel!
    @IBOutlet weak var c2AlarmOnOffSwitch: UISwitch!
    @IBOutlet weak var c2CamerasTitleLabel: UILabel!
    @IBOutlet weak var c2CamerasOnOffSwitch: UISwitch!
    
    @IBOutlet weak var baseboardTitleLabel: UILabel!
    @IBOutlet weak var generalFirstScreenTitleLabel: UILabel!
    
    private let heaterHourComponent = 0
    private let heaterMinuteComponent = 1
    private let heaterSecondComponent = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.onModelUpdate = { [weak self] in
            self?.updateUI()
        }
    
        setupUI()
    }

    @IBAction func generalAButtonTapped(_ sender: UIButton) {
    }
    
    @IBAction func generalBButtonTapped(_ sender: UIButton) {
    }
    @IBAction func generalCButtonTapped(_ sender: Any) {
    }
    @IBAction func generalAllButtonTapped(_ sender: Any) {
    }
    
    
    @objc func switchValueChanged(_ sender: UISwitch) {
        switch sender {
        case a1TVOnOffSwitch:
            viewModel.didSwitchTVTo(value: sender.isOn)
        case a2StereoOnOffSwitch:
            viewModel.didSwitchStereoTo(value: sender.isOn)
        case b1AirCondOnOffSwitch:
            viewModel.didSwitchAirCondTo(value: sender.isOn)
        case b2HeaterOnOffSwitch:
            viewModel.didSwitchHeaterTo(value: sender.isOn)
        case c1LightOnOffSwitch:
            viewModel.didSwitchLightTo(value: sender.isOn)
        case c2SecurityGeneralOnOffSwitch:
            viewModel.didSwitchGeneralSecTo(value: sender.isOn)
        case c2AlarmOnOffSwitch:
            viewModel.didSwitchAlarmSecTo(value: sender.isOn)
        case c2CamerasOnOffSwitch:
            viewModel.didSwitchCamTo(value: sender.isOn)
        default: break
        }
    }
    
    @objc func sliderValueChanged(_ sender: UISlider) {
        switch sender {
        case a1TVVolumeSlider:
            viewModel.didSetTVVolume(value: sender.value)
        case a2StereoVolumeSlider:
            viewModel.didSetStereoVolume(value: sender.value)
        case b1AirCondTemperatureSlider:
            viewModel.didSetAirCondTemperature(value: sender.value)
        case b2HeaterTemperatureSlider:
            viewModel.didSetHeaterTemperature(value: sender.value)
        case c1LightLuminositySlider:
            viewModel.didSetLightLuminosity(value: sender.value)
        default: break
        }
    }
    
// MARK: Helpers
    
    private func setupUI() {
        setupPickerViews()
        setupSwitches()
        setupSliders()
        updateUI()
    }
    
    private func updateUI() {
        updateSliders()
        updateSwitches()
        updateLabels()
        updatePickerViews()
    }
    
    private func setupPickerViews() {
        a1TVChooseChanelPickerView.delegate = self
        a1TVChooseChanelPickerView.dataSource = self
        a2StereoChoosePlaylistPickerView.delegate = self
        a2StereoChoosePlaylistPickerView.dataSource = self
        b1AirCondTemperatureChoosePowerPickerView.delegate = self
        b1AirCondTemperatureChoosePowerPickerView.dataSource = self
        b2HeaterTimerChoosePickerView.delegate = self
        b2HeaterTimerChoosePickerView.dataSource = self
        c1LightTimerChoosePickerView.delegate = self
        c1LightTimerChoosePickerView.dataSource = self
    }
    
    private func setupSwitches() {
        a1TVOnOffSwitch.addTarget(self, action: #selector(switchValueChanged(_:)), for: .valueChanged)
        a2StereoOnOffSwitch.addTarget(self, action: #selector(switchValueChanged(_:)), for: .valueChanged)
        b1AirCondOnOffSwitch.addTarget(self, action: #selector(switchValueChanged(_:)), for: .valueChanged)
        b2HeaterOnOffSwitch.addTarget(self, action: #selector(switchValueChanged(_:)), for: .valueChanged)
        c1LightOnOffSwitch.addTarget(self, action: #selector(switchValueChanged(_:)), for: .valueChanged)
        c2SecurityGeneralOnOffSwitch.addTarget(self, action: #selector(switchValueChanged(_:)), for: .valueChanged)
        c2AlarmOnOffSwitch.addTarget(self, action: #selector(switchValueChanged(_:)), for: .valueChanged)
        c2CamerasOnOffSwitch.addTarget(self, action: #selector(switchValueChanged(_:)), for: .valueChanged)
    }
    
    private func setupSliders() {
        a1TVVolumeSlider.minimumValue = viewModel.minTVVolumeValue
        a1TVVolumeSlider.maximumValue = viewModel.maxTVVolumeValue
        a2StereoVolumeSlider.minimumValue = viewModel.minStereoVolumeValue
        a2StereoVolumeSlider.maximumValue = viewModel.maxStereoVolumeValue
        b1AirCondTemperatureSlider.minimumValue = viewModel.minAirCondTemperatureValue
        b1AirCondTemperatureSlider.maximumValue = viewModel.maxAirCondTemperatureValue
        b2HeaterTemperatureSlider.minimumValue = viewModel.minHeaterTemperatureValue
        b2HeaterTemperatureSlider.maximumValue = viewModel.maxHeaterTemperatureValue
        c1LightLuminositySlider.minimumValue = viewModel.minStereoVolumeValue
        c1LightLuminositySlider.maximumValue = viewModel.maxStereoVolumeValue
        
        a1TVVolumeSlider.addTarget(self, action: #selector(sliderValueChanged(_: )), for: .valueChanged)
        a2StereoVolumeSlider.addTarget(self, action: #selector(sliderValueChanged(_: )), for: .valueChanged)
        b1AirCondTemperatureSlider.addTarget(self, action: #selector(sliderValueChanged(_: )), for: .valueChanged)
        b2HeaterTemperatureSlider.addTarget(self, action: #selector(sliderValueChanged(_: )), for: .valueChanged)
        c1LightLuminositySlider.addTarget(self, action: #selector(sliderValueChanged(_: )), for: .valueChanged)
    }
    
    private func updateSwitches() {
        a1TVOnOffSwitch.isOn = viewModel.tvIsOn
        a2StereoOnOffSwitch.isOn = viewModel.stereoIsOn
        b1AirCondOnOffSwitch.isOn = viewModel.airCondIsOn
        b2HeaterOnOffSwitch.isOn = viewModel.heaterIsOn
        c1LightOnOffSwitch.isOn = viewModel.lightIsOn
        c2SecurityGeneralOnOffSwitch.isOn = viewModel.generalSecIsOn
        c2AlarmOnOffSwitch.isOn = viewModel.alarmIsOn
        c2CamerasOnOffSwitch.isOn = viewModel.camAreOn
    }
    
    private func updateSliders() {
        a1TVVolumeSlider.value = viewModel.initialTVVolume
        a2StereoVolumeSlider.value = viewModel.initialStereoVolume
        b1AirCondTemperatureSlider.value = viewModel.initialAirCondTemperature
        b2HeaterTemperatureSlider.value = viewModel.initialHeaterTemperature
        c1LightLuminositySlider.value = viewModel.initialLightClarity
    }
    
    private func updateLabels() {
        b1AirCondTemperatureQuantityLabel.text = viewModel.airCondTemperatureValue
        b2HeaterTemperatureQuantityLabel.text = viewModel.heaterTemperatureValue
    }
    
    private func updatePickerViews() {
        a1TVChooseChanelPickerView.selectRow(viewModel.initialTVChannel, inComponent: 0, animated: true)
        a2StereoChoosePlaylistPickerView.selectRow(viewModel.initialStereoPlaylist, inComponent: 0, animated: true)
        b1AirCondTemperatureChoosePowerPickerView.selectRow(viewModel.initialAirCondPower, inComponent: 0, animated: true)
        b2HeaterTimerChoosePickerView.selectRow(viewModel.heaterTimmerHour, inComponent: heaterHourComponent, animated: true)
        b2HeaterTimerChoosePickerView.selectRow(viewModel.heaterTimmerMinute, inComponent: heaterMinuteComponent, animated: true)
        b2HeaterTimerChoosePickerView.selectRow(viewModel.heaterTimmerSecond, inComponent: heaterSecondComponent, animated: true)
    }
}

extension AHCMainViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        var numberOfComponents: Int = viewModel.oneComponetNumber
        
        if(pickerView == c1LightTimerChoosePickerView) {
            numberOfComponents = viewModel.timerComponentsNumber
        }
        return numberOfComponents
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        var numbersOfRows: Int = 0
        
        switch pickerView {
        case a1TVChooseChanelPickerView:
            numbersOfRows = viewModel.tvChanelNumRows
        case a2StereoChoosePlaylistPickerView:
            numbersOfRows = viewModel.stereoPlaylistNumRows
        case b1AirCondTemperatureChoosePowerPickerView:
            numbersOfRows = viewModel.airCondPowerLevelNumRows
        case b2HeaterTimerChoosePickerView:
            switch component {
            case 0:
                numbersOfRows = viewModel.timerHourNumRows
            case 1:
                numbersOfRows = viewModel.timerMinuteNumRows
            default:
                numbersOfRows = viewModel.timerSecondsNumRows
            }
        case c1LightTimerChoosePickerView:
            switch component {
            case 0:
                numbersOfRows = viewModel.timerHourNumRows
            case 1:
                numbersOfRows = viewModel.timerMinuteNumRows
            default:
                numbersOfRows = viewModel.timerSecondsNumRows
            }
        default:
            numbersOfRows = 0
        }
        return numbersOfRows
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        var rowTitle: String?
        
        switch pickerView {
        case a1TVChooseChanelPickerView:
            rowTitle = viewModel.titleForTVChanelPicker(index: row)
        case a2StereoChoosePlaylistPickerView:
            rowTitle = viewModel.titleForStereoPlaylistPicker(index: row)
        case b1AirCondTemperatureChoosePowerPickerView:
            rowTitle = viewModel.titleForTemperaturePowerPicker(index: row)
        case b2HeaterTimerChoosePickerView:
            switch component {
            case 0:
                rowTitle = viewModel.titleForHeaterHoursTimerPicker(index: row)
            case 1:
                rowTitle = viewModel.titleForHeaterMinutesTimerPicker(index: row)
            default:
                rowTitle = viewModel.titleForHeaterSecondsTimerPicker(index: row)
            }
        case c1LightTimerChoosePickerView:
            switch component {
            case 0:
                rowTitle = viewModel.titleForLightHoursTimerPicker(index: row)
            case 1:
                rowTitle = viewModel.titleForLightMinutesTimerPicker(index: row)
            default:
                rowTitle = viewModel.titleForLightSecondsTimerPicker(index: row)
            }
        default:
            rowTitle = ""
        }
        return rowTitle
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView {
        case a1TVChooseChanelPickerView:
            viewModel.didSelectTVPicker(row: row)
        case a2StereoChoosePlaylistPickerView:
            viewModel.didSelectPlaylistPicker(row: row)
        case b2HeaterTimerChoosePickerView:
            switch component {
            
            case 0:
                viewModel.didSelectHourPicker(row: row)
            case 1:
                viewModel.didSelectMinutePicker(row: row)
            default:
                viewModel.didSelectSecondPicker(row: row)
            }
        case c1LightTimerChoosePickerView:
            switch component {
            
            case 0:
                viewModel.didSelectHourPicker(row: row)
            case 1:
                viewModel.didSelectMinutePicker(row: row)
            default:
                viewModel.didSelectSecondPicker(row: row)
            }
        default:
            viewModel.didSelectSecondPicker(row: 0)
        }
    }
}
