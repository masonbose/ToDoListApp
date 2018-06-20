//
//  LATableView.swift
//  ListApp
//
//  Created by Mason Bose on 6/13/18.
//  Copyright © 2018 Mason Bose. All rights reserved.
//

import UIKit

class LATableView: UITableView {
    
    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
        checkIfAutoLayout()
        backgroundColor = .clear
        separatorStyle = .none
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
