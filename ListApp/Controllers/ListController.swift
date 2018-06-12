//
//  ListController.swift
//  ListApp
//
//  Created by Mason Bose on 6/11/18.
//  Copyright © 2018 Mason Bose. All rights reserved.
//

import UIKit

class ListController: UIViewController, LAHeaderDelegate {
    
    func addItem() {
        print("trying to add item from header")
    }
    
    let header = LAHeaderView(title: "Stuff To Get Done", subtitle: "4 Left")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view.addSubview(header)
        NSLayoutConstraint.activate([
            header.topAnchor.constraint(equalTo: view.topAnchor),
            header.leftAnchor.constraint(equalTo: view.leftAnchor),
            header.rightAnchor.constraint(equalTo: view.rightAnchor),
            header.heightAnchor.constraint(equalToConstant: 120)
            ])
        
        header.delegate = self
    }
}
