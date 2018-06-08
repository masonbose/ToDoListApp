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
    }

}
