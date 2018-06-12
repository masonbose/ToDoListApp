//
//  OptionSet.swift
//  ListApp
//
//  Created by Mason Bose on 6/11/18.
//  Copyright © 2018 Mason Bose. All rights reserved.
//

import Foundation

struct ButtonOptions: OptionSet {
   
    let rawValue: Int
    
    static let roundedText = ButtonOptions(rawValue: 1 << 0)
    static let squareIcon = ButtonOptions(rawValue: 1 << 1)
}
