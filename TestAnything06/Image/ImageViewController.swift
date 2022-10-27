//
//  ImageViewController.swift
//  TestAnything06
//
//  Created by Brother Model on 2022/10/26.
//

import UIKit

class ImageViewController: UIViewController {
    
    let mainView = ImageView()
    let viewModel = ImageViewModel()
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mainView.searchBar.delegate = self

        setCollectionViewConfigure()

        viewModel.list.bind { value in
            DispatchQueue.main.sync {
                self.mainView.collectionView.reloadData()
            }
        }
    }
        
    private func setCollectionViewConfigure() {
        mainView.collectionView.delegate = self
        mainView.collectionView.dataSource = self
        mainView.collectionView.register(ImageCollectionViewCell.self, forCellWithReuseIdentifier: "ImageCollectionViewCell")
    }
}

extension ImageViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.list.value.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCollectionViewCell", for: indexPath) as? ImageCollectionViewCell else { return UICollectionViewCell() }
        cell.setImage(url: viewModel.list.value[indexPath.item].url)
        return cell
    }
}

extension ImageViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("search button clicked")
        let query = mainView.searchBar.text ?? ""
        mainView.searchBar.searchTextField.text = ""
        mainView.searchBar.resignFirstResponder()
        viewModel.fetch(query: query)
        
    }
}
