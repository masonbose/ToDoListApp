//
//  Protocol.swift
//  ListApp
//
//  Created by Mason Bose on 6/12/18.
//  Copyright © 2018 Mason Bose. All rights reserved.
//

import UIKit

protocol LAHeaderDelegate {
    func openAddItemPopup()
}

protocol LANewItemDelegate {
    func addItemToList(text: String)
}


