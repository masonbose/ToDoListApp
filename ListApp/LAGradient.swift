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
        UIColor.init(rgb: 0x64E4FF).cgColor,
        UIColor.init(rgb: 0x3A7BDB5).cgColor
    ]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
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
