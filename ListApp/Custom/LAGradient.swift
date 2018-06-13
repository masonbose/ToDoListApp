//
//  LAGradient.swift
//  ListApp
//
//  Created by Mason Bose on 6/7/18.
//  Copyright © 2018 Mason Bose. All rights reserved.
//

import UIKit

class LAGradient: UIView {
    
    var hexColors: [CGColor] = [
        UIColor.blueZero.cgColor,
        UIColor.blueOne.cgColor
    ]
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        
        if frame == .zero {
            self.translatesAutoresizingMaskIntoConstraints = false
        }
        
        if let layer = self.layer as? CAGradientLayer {
            layer.colors = self.hexColors
            layer.locations = [0.0, 1.2]
        }
    }
    
    override class var layerClass: AnyClass {
        return CAGradientLayer.self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
