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
    
    @IBOutlet weak var areaB2AquecedorTitleLabel: UILabel!
    @IBOutlet weak var areaB2AquecedorOnOffSwitch: UISwitch!
    @IBOutlet weak var areaB2AquecedorTemperatureTitleLabel: UILabel!
    @IBOutlet weak var areaB2AquecedorTemperatureSlider: UISlider!
    @IBOutlet weak var areaB2AquecedorTemperatureCMark: UILabel!
    @IBOutlet weak var areaB2AquecedorTemperatureQuantity: UILabel!
    @IBOutlet weak var areaB2AquecedorTimerTitleLabel: UILabel!
    @IBOutlet weak var areaB2AquecedorTimerChoosePickerView: UIPickerView!
    
    @IBOutlet weak var areaC1LuzTitleLabel: UILabel!
    @IBOutlet weak var areaC1LuzOnOffSwitch: UISwitch!
    @IBOutlet weak var areaC1LuzClarityTitleLabel: UILabel!
    @IBOutlet weak var areaC1LuzClaritySlider: UISlider!
    @IBOutlet weak var areaC1LuzTimerTitleLabel: UILabel!
    @IBOutlet weak var areaC1LuzTimerChoosePickerView: UIPickerView!
    
    @IBOutlet weak var areaC2SegurancaTitleLabel: UILabel!
    @IBOutlet weak var areaC2SegurancaGeneralOnOffSwitch: UISwitch!
    @IBOutlet weak var areaC2AlarmTitleLabel: UILabel!
    @IBOutlet weak var areaC2AlarmOnOffSwitch: UISwitch!
    @IBOutlet weak var areaC2CamerasTitleLabel: UILabel!
    @IBOutlet weak var areaC2CamerasOnOffSwitch: UISwitch!
    
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

    @IBAction func areaAGeneralButtonTapped(_ sender: UIButton) {
    }
    
    @IBAction func areaBGeneralButtonTapped(_ sender: UIButton) {
    }
    @IBAction func areaCGeneralButtonTapped(_ sender: Any) {
    }
    @IBAction func generalButtonTapped(_ sender: Any) {
    }
    
    
    @objc func switchValueChanged(_ sender: UISwitch) {
        switch sender {
        case a1TVOnOffSwitch:
            viewModel.didSwitchTVTo(value: sender.isOn)
        case a2StereoOnOffSwitch:
            viewModel.didSwitchStereoTo(value: sender.isOn)
        case b1AirCondOnOffSwitch:
            viewModel.didSwitchArCondTo(value: sender.isOn)
        case areaB2AquecedorOnOffSwitch:
            viewModel.didSwitchHeaterTo(value: sender.isOn)
        case areaC1LuzOnOffSwitch:
            viewModel.didSwitchLightTo(value: sender.isOn)
        case areaC2SegurancaGeneralOnOffSwitch:
            viewModel.didSwitchGeneralSegTo(value: sender.isOn)
        case areaC2AlarmOnOffSwitch:
            viewModel.didSwitchAlarmSegTo(value: sender.isOn)
        case areaC2CamerasOnOffSwitch:
            viewModel.didSwitchCamTo(value: sender.isOn)
        default: break
        }
    }
    
    @objc func sliderValueChanged(_ sender:UISlider) {
        switch sender {
        case a1TVVolumeSlider:
            viewModel.didSetTVVolume(value: sender.value)
        case a2StereoVolumeSlider:
            viewModel.didSetStereoVolume(value: sender.value)
        case b1AirCondTemperatureSlider:
            viewModel.didSetArCondTemperature(value: sender.value)
        case areaB2AquecedorTemperatureSlider:
            viewModel.didSetHeaterTemperature(value: sender.value)
        case areaC1LuzClaritySlider:
            viewModel.didSetLightClarity(value: sender.value)
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
        areaB2AquecedorTimerChoosePickerView.delegate = self
        areaB2AquecedorTimerChoosePickerView.dataSource = self
        areaC1LuzTimerChoosePickerView.delegate = self
        areaC1LuzTimerChoosePickerView.dataSource = self
        
    }
    
    private func setupSwitches() {
        a1TVOnOffSwitch.addTarget(self, action: #selector(switchValueChanged(_:)), for: .valueChanged)
        a2StereoOnOffSwitch.addTarget(self, action: #selector(switchValueChanged(_:)), for: .valueChanged)
        b1AirCondOnOffSwitch.addTarget(self, action: #selector(switchValueChanged(_:)), for: .valueChanged)
        areaB2AquecedorOnOffSwitch.addTarget(self, action: #selector(switchValueChanged(_:)), for: .valueChanged)
        areaC1LuzOnOffSwitch.addTarget(self, action: #selector(switchValueChanged(_:)), for: .valueChanged)
        areaC2SegurancaGeneralOnOffSwitch.addTarget(self, action: #selector(switchValueChanged(_:)), for: .valueChanged)
        areaC2AlarmOnOffSwitch.addTarget(self, action: #selector(switchValueChanged(_:)), for: .valueChanged)
        areaC2CamerasOnOffSwitch.addTarget(self, action: #selector(switchValueChanged(_:)), for: .valueChanged)
    }
    
    private func setupSliders() {
        a1TVVolumeSlider.minimumValue = viewModel.minTVVolumeValue
        a1TVVolumeSlider.maximumValue = viewModel.maxTVVolumeValue
        a2StereoVolumeSlider.minimumValue = viewModel.minSomVolumeValue
        a2StereoVolumeSlider.maximumValue = viewModel.maxSomVolumeValue
        b1AirCondTemperatureSlider.minimumValue = viewModel.minArCondTemperatureValue
        b1AirCondTemperatureSlider.maximumValue = viewModel.maxArCondTemperatureValue
        areaB2AquecedorTemperatureSlider.minimumValue = viewModel.minAquecTemperatureValue
        areaB2AquecedorTemperatureSlider.maximumValue = viewModel.maxAquecTemperatureValue
        areaC1LuzClaritySlider.minimumValue = viewModel.minSomVolumeValue
        areaC1LuzClaritySlider.maximumValue = viewModel.maxSomVolumeValue
        
        a1TVVolumeSlider.addTarget(self, action: #selector(sliderValueChanged(_: )), for: .valueChanged)
        a2StereoVolumeSlider.addTarget(self, action: #selector(sliderValueChanged(_: )), for: .valueChanged)
        b1AirCondTemperatureSlider.addTarget(self, action: #selector(sliderValueChanged(_: )), for: .valueChanged)
        areaB2AquecedorTemperatureSlider.addTarget(self, action: #selector(sliderValueChanged(_: )), for: .valueChanged)
        areaC1LuzClaritySlider.addTarget(self, action: #selector(sliderValueChanged(_: )), for: .valueChanged)
    }
    
    private func updateSwitches() {
        a1TVOnOffSwitch.isOn = viewModel.tvIsOn
        a2StereoOnOffSwitch.isOn = viewModel.stereoIsOn
        b1AirCondOnOffSwitch.isOn = viewModel.arCondIsOn
        areaB2AquecedorOnOffSwitch.isOn = viewModel.heaterIsOn
        areaC1LuzOnOffSwitch.isOn = viewModel.lightIsOn
        areaC2SegurancaGeneralOnOffSwitch.isOn = viewModel.generalSegIsOn
        areaC2AlarmOnOffSwitch.isOn = viewModel.alarmIsOn
        areaC2CamerasOnOffSwitch.isOn = viewModel.camAreOn
    }
    
    private func updateSliders() {
        a1TVVolumeSlider.value = viewModel.initialTVVolume
        a2StereoVolumeSlider.value = viewModel.initialStereoVolume
        b1AirCondTemperatureSlider.value = viewModel.initialArCondTemperature
        areaB2AquecedorTemperatureSlider.value = viewModel.initialHeaterTemperature
        areaC1LuzClaritySlider.value = viewModel.initialLightClarity
    }
    
    private func updateLabels() {
        b1AirCondTemperatureQuantityLabel.text = viewModel.arCondTemperatureValue
        areaB2AquecedorTemperatureQuantity.text = viewModel.aquecTemperatureValue
    }
    
    private func updatePickerViews() {
        a1TVChooseChanelPickerView.selectRow(viewModel.initialTVChannel, inComponent: 0, animated: true)
        a2StereoChoosePlaylistPickerView.selectRow(viewModel.initialStereoPlaylist, inComponent: 0, animated: true)
        b1AirCondTemperatureChoosePowerPickerView.selectRow(viewModel.initialArCondPower, inComponent: 0, animated: true)
        areaB2AquecedorTimerChoosePickerView.selectRow(viewModel.heaterTimmerHour, inComponent: heaterHourComponent, animated: true)
        areaB2AquecedorTimerChoosePickerView.selectRow(viewModel.heaterTimmerMinute, inComponent: heaterMinuteComponent, animated: true)
        areaB2AquecedorTimerChoosePickerView.selectRow(viewModel.heaterTimmerSecond, inComponent: heaterSecondComponent, animated: true)
    }
    A
    
}

extension AHCMainViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        var numberOfComponents: Int = viewModel.oneComponetNumber
        
        if(pickerView == areaC1LuzTimerChoosePickerView) {
            numberOfComponents = viewModel.timerComponentsNumber
        }
        
        return numberOfComponents
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        var numbersOfRows: Int = 0

        if(pickerView == a1TVChooseChanelPickerView) {
            numbersOfRows = viewModel.tvChanelNumRows
        }
        if(pickerView == a2StereoChoosePlaylistPickerView) {
            numbersOfRows = viewModel.somPlaylistNumRows
        }
        if(pickerView == b1AirCondTemperatureChoosePowerPickerView) {
            numbersOfRows = viewModel.arCondPowerLevelNumRows
        }
        
        if(pickerView == areaB2AquecedorTimerChoosePickerView) {
            switch component {
            case 0:
                numbersOfRows = viewModel.timerHourNumRows
            case 1:
                numbersOfRows = viewModel.timerMinuteNumRows
            default:
                numbersOfRows = viewModel.timerSecondsNumRows
            }
        }
        if(pickerView == areaC1LuzTimerChoosePickerView) {
            switch component {
            case 0:
                numbersOfRows = viewModel.timerHourNumRows
            case 1:
                numbersOfRows = viewModel.timerMinuteNumRows
            default:
                numbersOfRows = viewModel.timerSecondsNumRows
            }
        }
        
        return numbersOfRows
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        var rowTitle: String?
        
        if(pickerView == a1TVChooseChanelPickerView) {
            rowTitle = viewModel.titleForTVChanelPicker(index: row)
        }
        if(pickerView == a2StereoChoosePlaylistPickerView) {
            rowTitle = viewModel.titleForSomPlaylistPicker(index: row)
        }
        if(pickerView == b1AirCondTemperatureChoosePowerPickerView) {
            rowTitle = viewModel.titleForTemperaturePowerPicker(index: row)
        }
        
        if(pickerView == areaB2AquecedorTimerChoosePickerView) {
            switch component {
            case 0:
                rowTitle = viewModel.titleForHoursAquecedorTimerPicker(index: row)
            case 1:
                rowTitle = viewModel.titleForMinutesAquecedorTimerPicker(index: row)
            default:
                rowTitle = viewModel.titleForSecondsAquecedorTimerPicker(index: row)
            }
        }
        if(pickerView == areaC1LuzTimerChoosePickerView) {
            switch component {
            case 0:
                rowTitle = viewModel.titleForHoursLuzTimerPicker(index: row)
            case 1:
                rowTitle = viewModel.titleForMinutesLuzTimerPicker(index: row)
            default:
                rowTitle = viewModel.titleForSecondsLuzTimerPicker(index: row)
            }
        }
        
        return rowTitle
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if(pickerView == a1TVChooseChanelPickerView) {
            viewModel.didSelectTVPicker(row: row)
        }
        if(pickerView == a2StereoChoosePlaylistPickerView) {
            viewModel.didSelectPlaylistPicker(row: row)
        }
        if(pickerView == areaB2AquecedorTimerChoosePickerView) {
            switch component {
            
            case 0:
                viewModel.didSelectHourPicker(row: row)
            case 1:
                viewModel.didSelectMinutePicker(row: row)
            default:
                viewModel.didSelectSecondPicker(row: row)
            }
        }
        if(pickerView == areaC1LuzTimerChoosePickerView) {
            switch component {
            
            case 0:
                viewModel.didSelectHourPicker(row: row)
            case 1:
                viewModel.didSelectMinutePicker(row: row)
            default:
                viewModel.didSelectSecondPicker(row: row)
            }
        }
        
        setupUI()
    }
}
