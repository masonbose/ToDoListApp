//
//  LALabel.swift
//  ListApp
//
//  Created by Mason Bose on 6/9/18.
//  Copyright © 2018 Mason Bose. All rights reserved.
//

import UIKit

class LALabel: UILabel {
    
    init(title: String = "Default String", color: UIColor = .white, size: CGFloat = 16, textAlignment: NSTextAlignment = .left, frame: CGRect = .zero) {
        super.init(frame: frame)
        if frame == .zero {
            self.translatesAutoresizingMaskIntoConstraints = false
        }
        self.text = title
        self.textColor = color
        self.font = UIFont.init(name: "Raleway-v4020-Regular", size: size)
        self.textAlignment = textAlignment
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
