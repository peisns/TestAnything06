//
//  SecondImageView.swift
//  TestAnything06
//
//  Created by Brother Model on 2022/10/27.
//

import UIKit

final public class SecondImageView: UIView {
    
    public let appendBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("append", for: .normal)
        return btn
    }()

    public let InsertBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("insert", for: .normal)
        return btn
    }()

    public let DeleteBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("delete", for: .normal)
        return btn
    }()

    
    public let tableView: UITableView = {
        let view = UITableView()
        return view
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
        [appendBtn, InsertBtn, DeleteBtn, tableView].forEach {
            addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            
            appendBtn.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            appendBtn.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            appendBtn.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            appendBtn.heightAnchor.constraint(equalToConstant: 44),
            
            InsertBtn.topAnchor.constraint(equalTo: appendBtn.bottomAnchor, constant: 16.0),
            InsertBtn.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            InsertBtn.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            InsertBtn.heightAnchor.constraint(equalToConstant: 44),
            
            DeleteBtn.topAnchor.constraint(equalTo: InsertBtn.bottomAnchor, constant: 16.0),
            DeleteBtn.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            DeleteBtn.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            DeleteBtn.heightAnchor.constraint(equalToConstant: 44),

            tableView.topAnchor.constraint(equalTo: DeleteBtn.bottomAnchor, constant: 16.0),
            tableView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor)
            
        ])
    }
    
}
