//
//  ImageCollectionViewCell.swift
//  TestAnything06
//
//  Created by Brother Model on 2022/10/26.
//

import UIKit

final class ImageCollectionViewCell: UICollectionViewCell {
    
    private let imageView: UIImageView = {
       let view = UIImageView()
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
    
    public func setImage(url: String) {
        let url = URL(string: url)
        let data = try? Data(contentsOf: url!)
        imageView.image = UIImage(data: data!)
    }
    
    private func setConfigure() {
        [imageView].forEach {
            contentView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor)
        ])
    }
    
}
