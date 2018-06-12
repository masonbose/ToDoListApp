//
//  LAButton.swift
//  ListApp
//
//  Created by Mason Bose on 6/10/18.
//  Copyright © 2018 Mason Bose. All rights reserved.
//

import UIKit

class LAButton: UIButton {
    
    var title: String!
    var type: ButtonOptions!
    
    init(title: String = "Default Button Text", frame: CGRect = .zero, type: ButtonOptions = .roundedText) {
        super.init(frame: frame)
        if frame == .zero {
            self.translatesAutoresizingMaskIntoConstraints = false
        }
        self.title = title
        self.type = type
        self.phaseTwo()
        }
    
    func phaseTwo() {
        self.setTitle(self.title, for: .normal)
        self.setTitleColor(.grayZero, for: .normal)
        self.backgroundColor = .white
        if let titleLabel = self.titleLabel {
            titleLabel.font = UIFont(name: "Raleway-v4020-Regular", size: 16)
        }
        
        
        switch self.type {
            case .roundedText:
                self.roundedText()
            case .squareIcon:
                self.squareIcon()
            default:
                break
        }
    }
    
    func squareIcon() {
        // where we set custom icons
    }
    
    func roundedText() {
        self.layer.cornerRadius = 20
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
