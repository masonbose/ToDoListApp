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
    
    let tbInset: CGFloat = 16
    
    lazy var bg: UIView = {
        let view = LAGradient()
        view.layer.cornerRadius = tbInset
        return view
    }()
    
    let listTable = LATableView()
    let CELL_ID = "cell_id"
    var listData: [ToDo] = [ToDo]()
    
   
    
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
        
        listData = [
            ToDo(id: 0, title: "first item", status: false),
            ToDo(id: 1, title: "hey dude", status: false),
            ToDo(id: 2, title: "this is fun", status: false)
        ]
        
        view.backgroundColor = .white
    
        view.addSubview(header)
        NSLayoutConstraint.activate([
            header.topAnchor.constraint(equalTo: view.topAnchor),
            header.leftAnchor.constraint(equalTo: view.leftAnchor),
            header.rightAnchor.constraint(equalTo: view.rightAnchor),
            header.heightAnchor.constraint(equalToConstant: 120)
            ])
        
        view.addSubview(bg)
        NSLayoutConstraint.activate([
            bg.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            bg.topAnchor.constraint(equalTo: header.bottomAnchor, constant: 20),
            bg.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            bg.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20)
            ])
        
        view.addSubview(listTable)
        NSLayoutConstraint.activate([
            listTable.leftAnchor.constraint(equalTo: bg.leftAnchor, constant: tbInset),
            listTable.topAnchor.constraint(equalTo: bg.topAnchor, constant: tbInset),
            listTable.bottomAnchor.constraint(equalTo: bg.bottomAnchor, constant: -tbInset),
            listTable.rightAnchor.constraint(equalTo: bg.rightAnchor, constant: -tbInset)
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
        
        listTable.delegate = self
        listTable.dataSource = self
        listTable.register(LAListCell.self, forCellReuseIdentifier: CELL_ID)
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

extension ListController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.listData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CELL_ID, for: indexPath) as! LAListCell
        cell.toDo = self.listData[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 42
    }
}
