//
//  BasicMVVMTableViewCell.swift
//  TestAnything06
//
//  Created by Brother Model on 2022/10/25.
//

import UIKit

final class BasicMVVMTableViewCell: UITableViewCell {
    
    let nameLabel: UILabel = {
        var label = UILabel()
        label.text = "name"
        return label
    }()
    
    let ageLabel: UILabel = {
        var label = UILabel()
        label.text = "age"
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: "BasicMVVMTableViewCell")
        setConfigure()
        setConstraint()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    private func setConfigure() {
        [nameLabel, ageLabel].forEach {
            contentView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
    }
    
    private func setConstraint() {
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            
            ageLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            ageLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        ])
    }
    
    func setConfigureWithPerson(person: Person) {
        nameLabel.text = person.name
        ageLabel.text = String(person.age)
    }

}
