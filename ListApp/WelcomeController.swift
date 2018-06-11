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
        view.layer.cornerRadius = 24
        return view
    }()
    
    let titleLabel: UILabel = {
        let label = LALabel(title: "Get It Done", size: 24, textAlignment: .center)
        return label
    }()
    
    let infoLabel: UILabel = {
       let label = LALabel(title: "WELCOME! LISTAPP IS A TO-DO LIST APP.\nITS A REALLY SICK TO-DO LIST.", color: .white, size: 14, textAlignment: .center)
        label.numberOfLines = 2
        return label
    }()
    
    let nextButton = LAButton(title: "START WINNING")
    
    let copyrightLabel = LALabel(title: "© 2018 | Mason Bose", color: .grayOne, size: 14, textAlignment: .center)

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
        
        bg.addSubview(infoLabel)
        NSLayoutConstraint.activate([
            infoLabel.centerXAnchor.constraint(equalTo: bg.centerXAnchor),
            infoLabel.centerYAnchor.constraint(equalTo: bg.centerYAnchor),
            infoLabel.widthAnchor.constraint(equalToConstant: 300),
            infoLabel.heightAnchor.constraint(equalToConstant: 40)
            ])
        
        bg.addSubview(nextButton)
        NSLayoutConstraint.activate([
            nextButton.widthAnchor.constraint(equalToConstant: 200),
            nextButton.heightAnchor.constraint(equalToConstant: 40),
            nextButton.centerXAnchor.constraint(equalTo: bg.centerXAnchor),
            nextButton.bottomAnchor.constraint(equalTo: bg.bottomAnchor, constant: -60)
            ])
        
        view.addSubview(copyrightLabel)
        NSLayoutConstraint.activate([
            copyrightLabel.widthAnchor.constraint(equalToConstant: 200),
            copyrightLabel.heightAnchor.constraint(equalToConstant: 40),
            copyrightLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            copyrightLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20)
            ])
    }
}
