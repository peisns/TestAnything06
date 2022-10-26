//
//  BasicMVVMView.swift
//  TestAnything06
//
//  Created by Brother Model on 2022/10/25.
//

import UIKit

final class BasicMVVMView: UIView {
    let textField: UITextField = {
       let tf = UITextField()
        tf.backgroundColor = .systemGray3
        return tf
    }()
    
    let returnBtn: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .white
        return btn
    }()

    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .yellow
        return tableView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setConfigure()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
 
    private func setConfigure() {
        backgroundColor = .orange
        
        [textField, returnBtn, tableView].forEach {
            addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16),
            textField.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            textField.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 200),
            textField.heightAnchor.constraint(equalToConstant: 44),
            
            returnBtn.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16),
            returnBtn.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -88),
            returnBtn.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            returnBtn.heightAnchor.constraint(equalToConstant: 44),
            
            tableView.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 16),
            tableView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
