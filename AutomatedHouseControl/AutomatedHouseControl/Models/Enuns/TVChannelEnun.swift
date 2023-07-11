//
//  TVChannelEnun.swift
//  AutomatedHouseControl
//
//  Created by User on 2/6/23.
//

import Foundation

extension TV {
    enum Channel: Int {
        case a = 1
        case b = 2
        case c = 3
        case d = 4
        case e = 5
        case f = 6
        case g = 7
        case h = 8
        case i = 9
        case j = 10
        
        static func allIChannels() -> [Channel] {
            return [.a, .b, .c, .d, .e, .f, .g, .h, .i, .j]
        }
    }
}
