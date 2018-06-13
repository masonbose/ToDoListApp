//
//  NewItemPopup.swift
//  ListApp
//
//  Created by Mason Bose on 6/12/18.
//  Copyright © 2018 Mason Bose. All rights reserved.
//

import UIKit

class LANewItemPopup: LAGradient {
    //don't need custom init with translatesautomask - LAGradient takes care of init
    
    let cancel = LAButton(title: "  cancel  ", type: .roundedText, radius: 4)
    let add = LAButton(title: "  add  ", type: .roundedText, radius: 4)
    let textField = LATextField(placeholder: "go buy IKEA picture frames", inset: 6)
    var delegate: LANewItemDelegate?
    
    @objc func handleCancel() {
        textField.resignFirstResponder()
    }
    
    @objc func handleAdd() {
        if let delegate = self.delegate, let textFieldText = self.textField.text {
            delegate.addItemToList(text: textFieldText)
        }
    }
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        
        let inset: CGFloat = 12
        
        self.layer.cornerRadius = 14
        
        addSubview(cancel)
        NSLayoutConstraint.activate([
            cancel.leftAnchor.constraint(equalTo: leftAnchor, constant: inset),
            cancel.topAnchor.constraint(equalTo: topAnchor, constant: inset),
            cancel.heightAnchor.constraint(equalToConstant: 20)
            ])
        
        addSubview(add)
        NSLayoutConstraint.activate([
            add.rightAnchor.constraint(equalTo: rightAnchor, constant: -inset),
            add.topAnchor.constraint(equalTo: topAnchor, constant: inset),
            add.heightAnchor.constraint(equalToConstant: 20)
            ])
        
        addSubview(textField)
        NSLayoutConstraint.activate([
            textField.leftAnchor.constraint(equalTo: leftAnchor, constant: inset),
            textField.rightAnchor.constraint(equalTo: rightAnchor, constant: -inset),
            textField.topAnchor.constraint(equalTo: add.bottomAnchor, constant: 8),
            textField.heightAnchor.constraint(equalToConstant: 28)
            ])
        
        cancel.addTarget(self, action: #selector(self.handleCancel), for: .touchUpInside)
        add.addTarget(self, action: #selector(self.handleAdd), for: .touchUpInside)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
