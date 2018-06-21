//
//  LAHeaderView.swift
//  ListApp
//
//  Created by Mason Bose on 6/11/18.
//  Copyright © 2018 Mason Bose. All rights reserved.
//

import UIKit

class LAHeaderView: UIView {
    
    let bg = LAGradient()
    let titleLabel = LALabel(size: 14)
    let subtitleLabel = LALabel(size: 24)
    let addButton = LAButton(type: .squareIcon)
    var delegate: LAHeaderDelegate?
    
    init(frame: CGRect = .zero, title: String = "Header Title", subtitle: String = "Header Subtitle ") {
        super.init(frame: frame)
        if frame == .zero {
            self.translatesAutoresizingMaskIntoConstraints = false
        }
        
        self.titleLabel.text = title
        self.subtitleLabel.text = subtitle
        
        setupLayout()
        
    }
    
    func setupLayout() {
       
        addSubview(bg)
        NSLayoutConstraint.activate([
            bg.leftAnchor.constraint(equalTo: leftAnchor),
            bg.rightAnchor.constraint(equalTo: rightAnchor),
            bg.topAnchor.constraint(equalTo: topAnchor),
            bg.bottomAnchor.constraint(equalTo: bottomAnchor)
            ])
        
        addSubview(titleLabel)
        addSubview(subtitleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 12),
            titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 28), //28 lines up with bg view
            titleLabel.rightAnchor.constraint(equalTo: centerXAnchor), //label box just extends towards middle of header
            //automatically takes height property from font size above
            ])
        
        NSLayoutConstraint.activate([
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            subtitleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 28),
            subtitleLabel.rightAnchor.constraint(equalTo: centerXAnchor, constant: 50)
            ])
        
        addSubview(addButton)
        NSLayoutConstraint.activate([
            addButton.bottomAnchor.constraint(equalTo: subtitleLabel.bottomAnchor),
            addButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -28),
            addButton.heightAnchor.constraint(equalToConstant: 24),
            addButton.widthAnchor.constraint(equalTo: addButton.heightAnchor, multiplier: 1)
            ])
        
        addButton.addTarget(self, action: #selector(handleAddButton), for: .touchUpInside)
    }
    
    @objc func handleAddButton() {
        //have to unwrap because var is optional
        if let delegate = self.delegate {
            delegate.openAddItemPopup()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
