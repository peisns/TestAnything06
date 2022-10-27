//
//  MemoTableViewCell.swift
//  TestAnything06
//
//  Created by Brother Model on 2022/10/27.
//

import UIKit

class MemoTableViewCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: "MemoTableViewCell")
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
