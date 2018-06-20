//
//  LACheckBox.swift
//  ListApp
//
//  Created by Mason Bose on 6/18/18.
//  Copyright © 2018 Mason Bose. All rights reserved.
//

import UIKit

class LACheckBox: UIButton {
    
    var toggled: Bool? {
        didSet {
            if let toggled = toggled {
                if toggled {
                    backgroundColor = .green
                } else {
                    backgroundColor = .clear
                }
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        
        layer.borderWidth = 1
        layer.borderColor = UIColor.grayZero.cgColor
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
