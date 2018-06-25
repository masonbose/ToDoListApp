//
//  LATableCell.swift
//  ListApp
//
//  Created by Mason Bose on 6/17/18.
//  Copyright © 2018 Mason Bose. All rights reserved.
//

import UIKit

class LAListCell: UITableViewCell {
    
    var delegate: LAListCellDelegate?
    
    @objc func toggleStatus() {
        if let delegate = self.delegate, let toDo = self.toDo {
            let newToDo = ToDo(id: toDo.id, title: textField.text!, status: !toDo.status)
            delegate.toggleTodo(toDo: newToDo)
        }
    }
    
    
    let textField = LATextField(placeholder: "ToDo", radius: 0, inset: 14)
    
    let view: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let box = LACheckBox()
    
    var toDo: ToDo? {
        didSet {
            if let toDo = toDo {
                box.toggled = toDo.status
                box.id = toDo.id
                textField.text = toDo.title
            }
        }
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        box.addTarget(self, action: #selector(self.toggleStatus), for: .touchUpInside)
        
        selectionStyle = .none
        backgroundColor = .clear
        view.backgroundColor = .white
        
        addSubview(view)
        NSLayoutConstraint.activate([
            view.leftAnchor.constraint(equalTo: leftAnchor),
            view.topAnchor.constraint(equalTo: topAnchor, constant: 3),
            view.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -3),
            view.rightAnchor.constraint(equalTo: rightAnchor)
            ])
        
        view.addSubview(textField)
        NSLayoutConstraint.activate([
            textField.leftAnchor.constraint(equalTo: leftAnchor),
            textField.topAnchor.constraint(equalTo: topAnchor, constant: 6),
            textField.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -6),
            textField.rightAnchor.constraint(equalTo: rightAnchor)
            ])
        
        addSubview(box)
        NSLayoutConstraint.activate([
            box.rightAnchor.constraint(equalTo: rightAnchor, constant: -14),
            box.centerYAnchor.constraint(equalTo: centerYAnchor),
            box.widthAnchor.constraint(equalToConstant: 22),
            box.heightAnchor.constraint(equalTo: box.widthAnchor)
            ])
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
