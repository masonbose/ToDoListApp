//
//  Extensions.swift
//  ListApp
//
//  Created by Mason Bose on 6/7/18.
//  Copyright © 2018 Mason Bose. All rights reserved.
//

import UIKit

extension UIColor {
    
    convenience init(red: Int, green: Int, blue: Int) {
        self.init(red: CGFloat(red)/255, green: CGFloat(green)/255, blue: CGFloat(blue), alpha: 1.0)
    }
    
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
    
}
