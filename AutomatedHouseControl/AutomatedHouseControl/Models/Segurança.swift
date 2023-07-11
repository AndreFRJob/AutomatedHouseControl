//
//  Segurança.swift
//  AutomatedHouseControl
//
//  Created by User on 26/5/23.
//

import Foundation

class Segurança: EletronicsProtocol {
    var isOn: Bool
    var alarmIsON: Bool
    var camerasAreOn: Bool
    
    init(isOn: Bool, alarmIsON: Bool, camerasAreOn: Bool) {
        self.isOn = isOn
        self.alarmIsON = alarmIsON
        self.camerasAreOn = camerasAreOn
    }
    
    static func mock() -> EletronicsProtocol? {
        return Segurança(isOn: true, alarmIsON: false, camerasAreOn: true)
    }
    
    
}
