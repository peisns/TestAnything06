//
//  SecondTestViewController.swift
//  TestAnything06
//
//  Created by Brother Model on 2022/10/27.
//

import UIKit

final class SecondTestViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var collectionView: UICollectionView!
        var dataSource: UITableViewDiffableDataSource<Int, UUID>!
        collectionView.register(SecondTestCollectionViewCell.self, forCellReuseIdentifier: "SecondTestCollectionViewCell")

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

private extension UIConfigurationStateCustomKey {
    static let animal = UIConfigurationStateCustomKey("animal")
}
