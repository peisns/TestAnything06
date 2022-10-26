//
//  ImageView.swift
//  TestAnything06
//
//  Created by Brother Model on 2022/10/26.
//

import UIKit

final class ImageView: UIView {
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 16 // spacing between cell's row
        layout.minimumInteritemSpacing = 16 // spacing between cell's column
        layout.itemSize = CGSize(width: (UIScreen.main.bounds.width - 16) / 2, height: (UIScreen.main.bounds.width - 16) / 2)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0) // between cells and another view
        layout.scrollDirection = .vertical
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
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
        backgroundColor = .blue
        
        [collectionView].forEach {
            addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
