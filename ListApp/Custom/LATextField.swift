//
//  LATextField.swift
//  ListApp
//
//  Created by Mason Bose on 6/12/18.
//  Copyright © 2018 Mason Bose. All rights reserved.
//

import UIKit

class LATextField: UITextField {
    
    var insets: UIEdgeInsets!
    
    init(frame: CGRect = .zero, placeholder: String = "placeholder", radius: CGFloat = 4, inset: CGFloat = 0) {
        super.init(frame: frame)
        checkIfAutoLayout()
        
        self.placeholder = placeholder
        self.backgroundColor = .white
        self.layer.cornerRadius = radius
        self.insets = UIEdgeInsetsMake(0, inset, 0, 0)
        self.textColor = .grayZero
    }
    
    
    //These methods place text where placeholder text is in textfield
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, self.insets)
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, self.insets)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, self.insets)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
