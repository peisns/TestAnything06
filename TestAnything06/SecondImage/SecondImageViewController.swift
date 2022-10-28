//
//  SecondImageViewController.swift
//  TestAnything06
//
//  Created by Brother Model on 2022/10/27.
//

import UIKit

final class SecondImageViewController: UIViewController {

    private let mainView = SecondImageView()
    private let viewModel = SecondImageViewModel()
    
    private var colors: [UIColor] = [.blue, .green, .gray, .brown, .cyan, .lightGray, .purple]
    private var dataSource: UITableViewDiffableDataSource<Int, UUID>!
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTableViewConfigure()
        setBtnsAction()
        setBtnsAction()
    }
    
    private func setBtnsAction() {
        mainView.appendBtn.addTarget(self, action: #selector(appendBtnClicked), for: .touchUpInside)
        mainView.InsertBtn.addTarget(self, action: #selector(insertBtnClicked), for: .touchUpInside)
        mainView.DeleteBtn.addTarget(self, action: #selector(deleteBtnClicked), for: .touchUpInside)
    }
    
    @objc private func appendBtnClicked() {
        var snapshot = dataSource.snapshot()
        snapshot.appendItems([UUID()])
        dataSource.apply(snapshot)
    }

    @objc private func insertBtnClicked() {
        var snapshot = dataSource.snapshot()
        if let first = snapshot.itemIdentifiers.first {
            snapshot.insertItems([UUID()], afterItem: first)
        }
        dataSource.apply(snapshot)
    }

    @objc private func deleteBtnClicked() {
        var snapshot = dataSource.snapshot()
        if let last = snapshot.itemIdentifiers.last {
            snapshot.deleteItems([last])
        }

        dataSource.apply(snapshot)
    }

    private func setTableViewConfigure() {
        mainView.tableView.register(SecondImageTableViewCell.self, forCellReuseIdentifier: "SecondImageTableViewCell")
        
        dataSource = UITableViewDiffableDataSource<Int, UUID>(tableView: mainView.tableView, cellProvider: { tableView, indexPath, itemIdentifier in
            let cell = self.mainView.tableView.dequeueReusableCell(withIdentifier: "SecondImageTableViewCell", for: indexPath)
            cell.backgroundColor = self.colors[indexPath.row % self.colors.count]
            
            return cell
        })
        
        mainView.tableView.dataSource = dataSource
        
        var snapshot = NSDiffableDataSourceSnapshot<Int, UUID>()
        snapshot.appendSections([0])
        snapshot.appendItems([UUID(), UUID(), UUID()])
        dataSource.apply(snapshot)
    }
}
