//
//  ViewController.swift
//  AutomatedHouseControl
//
//  Created by User on 26/4/23.
//

import UIKit

class AHCMainViewController: UIViewController {
    
    var viewModel: AHCMainViewModel = .init()
    
    @IBOutlet weak var areaAGeneralButton: UIButton!
    @IBOutlet weak var areaAGeneralTitleLabel: UILabel!
    
    @IBOutlet weak var areaBGeneralButton: UIButton!
    @IBOutlet weak var areaBGeneralTitleLabel: UILabel!
    
    @IBOutlet weak var areaCGeneralButton: UIButton!
    @IBOutlet weak var areaCGeneralTitleLabel: UILabel!
    
    @IBOutlet weak var allAreasGeneralButton: UIButton!
    
    @IBOutlet weak var areaA1TVOnOffSwitch: UISwitch!
    @IBOutlet weak var areaA1TVTitleLabel: UILabel!
    @IBOutlet weak var areaA1TVChooseChanelPickerView: UIPickerView!
    @IBOutlet weak var areaA1TVChooseChanelTitleLabel: UILabel!
    @IBOutlet weak var areaA1TVVolumeTitleLabel: UILabel!
    @IBOutlet weak var areaA1TVVolumeSlider: UISlider!
    
    @IBOutlet weak var areaA2SomOnOffSwitch: UISwitch!
    @IBOutlet weak var areaA2SomTitleLabel: UILabel!
    @IBOutlet weak var areaA2SomChoosePlaylistPickerView: UIPickerView!
    @IBOutlet weak var areaA2SomChoosePlaylistLabel: UILabel!
    @IBOutlet weak var areaA2SomVolumeTitleLabel: UILabel!
    @IBOutlet weak var areaA2SomVolumeSlider: UISlider!
    
    @IBOutlet weak var areaB1ArCondTitleLabel: UILabel!
    @IBOutlet weak var areaB1ArCondOnOffSwitch: UISwitch!
    @IBOutlet weak var areaB1ArCondTemperatureTitleLabel: UILabel!
    @IBOutlet weak var areaB1ArCondTemperatureSlider: UISlider!
    @IBOutlet weak var areaB1ArCondTemperatureCMark: UILabel!
    @IBOutlet weak var areaB1ArCondTemperatureQuantity: UILabel!
    @IBOutlet weak var areaB1ArCondPowerTitleLabel: UILabel!
    @IBOutlet weak var areaB1ArCondTemperatureChoosePowerPickerView: UIPickerView!
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        areaA1TVVolumeSlider.minimumValue = viewModel.minTVVolumeValue
        areaA1TVVolumeSlider.maximumValue = viewModel.maxTVVolumeValue
        
        areaA2SomVolumeSlider.minimumValue = viewModel.minSomVolumeValue
        areaA2SomVolumeSlider.maximumValue = viewModel.maxSomVolumeValue
        
        areaB1ArCondTemperatureSlider.minimumValue = viewModel.minArCondTemperatureValue
        areaB1ArCondTemperatureSlider.maximumValue = viewModel.maxArCondTemperatureValue
        
        areaB2AquecedorTemperatureSlider.minimumValue = viewModel.minAquecTemperatureValue
        areaB2AquecedorTemperatureSlider.maximumValue = viewModel.maxAquecTemperatureValue
        
        areaC1LuzClaritySlider.minimumValue = viewModel.minSomVolumeValue
        areaC1LuzClaritySlider.maximumValue = viewModel.maxSomVolumeValue
        
        areaA1TVVolumeSlider.addTarget(self, action: #selector(sliderValueChange(_: )), for: .valueChanged)
        areaA2SomVolumeSlider.addTarget(self, action: #selector(sliderValueChange(_: )), for: .valueChanged)
        areaB1ArCondTemperatureSlider.addTarget(self, action: #selector(sliderValueChange(_: )), for: .valueChanged)
        areaB2AquecedorTemperatureSlider.addTarget(self, action: #selector(sliderValueChange(_: )), for: .valueChanged)
        areaC1LuzClaritySlider.addTarget(self, action: #selector(sliderValueChange(_: )), for: .valueChanged)
        
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
    
    
    @IBAction func areaA1TVSwitchChanged(_ sender: UISwitch) {
    }
    @IBAction func areaA2SomSwitchChanged(_ sender: UISwitch) {
    }
    @IBAction func areaB1ArCondSwitchChanged(_ sender: UISwitch) {
    }
    @IBAction func areaB2AquecSwitchChanged(_ sender: UISwitch) {
    }
    @IBAction func areaC1LuzSwitchChanged(_ sender: UISwitch) {
    }
    @IBAction func areaC2SegTVSwitchChanged(_ sender: UISwitch) {
    }
    @IBAction func areaC2AlrmSwitchChanged(_ sender: UISwitch) {
    }
    @IBAction func areaC2CamSwitchChanged(_ sender: UISwitch) {
    }

    
    @objc func sliderValueChange(_ sender:UISlider) {
        switch sender {
        case areaA1TVVolumeSlider:
            viewModel.didSetTVVolume(value: sender.value)
        case areaA2SomVolumeSlider:
            viewModel.didSetStereoVolume(value: sender.value)
        case areaB1ArCondTemperatureSlider:
            viewModel.didSetArCondTemperature(value: sender.value)
            areaB1ArCondTemperatureQuantity.text = "\(Int(sender.value))"
        case areaB2AquecedorTemperatureSlider:
            viewModel.didSetHeaterTemperature(value: sender.value)
            areaB2AquecedorTemperatureQuantity.text = "\(Int(sender.value))"
        case areaC1LuzClaritySlider:
            viewModel.didSetLightClarity(value: sender.value)
        default: break
        }
    }
    
// MARK: Helpers
    
    private func setupUI() {
        setupLuzTimerPickerView()
        setupTVChannelPickerView()
        setupSomPlsylistPickerView()
        setupAquecedorTimerChoosePickerView()
        setupArCondTemperatureChoosePowerPickerView()
    }
    
    
    private func setupTVChannelPickerView() {
        areaA1TVChooseChanelPickerView.delegate = self
        areaA1TVChooseChanelPickerView.dataSource = self
    }
    
    private func setupSomPlsylistPickerView() {
        areaA2SomChoosePlaylistPickerView.delegate = self
        areaA2SomChoosePlaylistPickerView.dataSource = self
    }
    
    private func setupArCondTemperatureChoosePowerPickerView() {
        areaB1ArCondTemperatureChoosePowerPickerView.delegate = self
        areaB1ArCondTemperatureChoosePowerPickerView.dataSource = self
    }
    
    private func setupAquecedorTimerChoosePickerView() {
        areaB2AquecedorTimerChoosePickerView.delegate = self
        areaB2AquecedorTimerChoosePickerView.dataSource = self
    }
    
    private func setupLuzTimerPickerView() {
        areaC1LuzTimerChoosePickerView.delegate = self
        areaC1LuzTimerChoosePickerView.dataSource = self
    }
    
    
    
    
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

        if(pickerView == areaA1TVChooseChanelPickerView) {
            numbersOfRows = viewModel.tvChanelNumRows
        }
        if(pickerView == areaA2SomChoosePlaylistPickerView) {
            numbersOfRows = viewModel.somPlaylistNumRows
        }
        if(pickerView == areaB1ArCondTemperatureChoosePowerPickerView) {
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
        
        if(pickerView == areaA1TVChooseChanelPickerView) {
            rowTitle = viewModel.titleForTVChanelPicker(index: row)
        }
        if(pickerView == areaA2SomChoosePlaylistPickerView) {
            rowTitle = viewModel.titleForSomPlaylistPicker(index: row)
        }
        if(pickerView == areaB1ArCondTemperatureChoosePowerPickerView) {
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
        
        if(pickerView == areaA1TVChooseChanelPickerView) {
            viewModel.didSelectTVPicker(row: row)
        }
        if(pickerView == areaA2SomChoosePlaylistPickerView) {
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
