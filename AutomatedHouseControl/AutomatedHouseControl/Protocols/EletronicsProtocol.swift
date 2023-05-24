//
//  EletronicsProtocol.swift
//  AutomatedHouseControl
//
//  Created by User on 24/5/23.
//

import Foundation

protocol EletronicsProtocol {
    var isOn: Bool { get set }
    static func mock() -> EletronicsProtocol
}
