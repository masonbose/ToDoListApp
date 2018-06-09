//
//  ViewController.swift
//  ListApp
//
//  Created by Mason Bose on 6/7/18.
//  Copyright © 2018 Mason Bose. All rights reserved.
//

import UIKit

class WelcomeController: UIViewController {
    
    let bg: UIView = {
        let view = LAGradient()
        view.layer.cornerRadius = 6
        return view
    }()
    
    let titleLabel: UILabel = {
        let label = LALabel(title: "Get It Done", size: 24, textAlignment: .center)
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view.addSubview(bg)
        NSLayoutConstraint.activate([
            bg.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            bg.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            bg.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            bg.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20)
            ])
        
        //you want to push the label down from the gradient background, not the top of screen - use "bg"
        bg.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.widthAnchor.constraint(equalToConstant: 200),
            titleLabel.heightAnchor.constraint(equalToConstant: 40),
            titleLabel.centerXAnchor.constraint(equalTo: bg.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: bg.topAnchor, constant: 60)
            ])
    }
}
