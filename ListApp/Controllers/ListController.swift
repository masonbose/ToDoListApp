//
//  ListController.swift
//  ListApp
//
//  Created by Mason Bose on 6/11/18.
//  Copyright © 2018 Mason Bose. All rights reserved.
//

import UIKit

class ListController: UIViewController, LAHeaderDelegate, LANewItemDelegate {
    
    func openAddItemPopup() {
        print("trying to open add item from view")
    }
    
    func addItemToList(text: String) {
        print("text: \(text)")
    }
    
    let header = LAHeaderView(title: "Stuff To Get Done", subtitle: "4 Left")
    let popup = LANewItemPopup()
    var keyboardHeight: CGFloat = 333 //have to get default value since it starts off at 0
    
    override func viewDidAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: NSNotification.Name.UIKeyboardDidShow, object: nil)
    }
    
    @objc func keyboardWillShow(notification: Notification) {
        let keyboardSize = (notification.userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue.size
        self.keyboardHeight = keyboardSize.height
    }

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
        
        view.addSubview(popup)
        NSLayoutConstraint.activate([
            popup.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            popup.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            popup.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            popup.heightAnchor.constraint(equalToConstant: 80)
            ])
        
        popup.textField.delegate = self
        popup.delegate = self
        header.delegate = self
        
    }
}

extension ListController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        popup.animateView(transform: CGAffineTransform(translationX: 0, y: -keyboardHeight), duration: 0.5)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        popup.animateView(transform: CGAffineTransform(translationX: 0, y: 0), duration: 0.6)
    }
}
