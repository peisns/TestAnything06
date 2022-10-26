//
//  BasicMVVMViewController.swift
//  TestAnything06
//
//  Created by Brother Model on 2022/10/25.
//

import UIKit

final class BasicMVVMViewController: UIViewController {

    var mainView = BasicMVVMView()
    var viewModel = PersonViewModel()

    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableViewConfigure()
        returnBtnMethod()
    }
    
    private func returnBtnMethod() {
        mainView.returnBtn.addTarget(self, action: #selector(returnBtnClicked), for: .touchUpInside)
    }
    @objc private func returnBtnClicked() {
        let typedText = mainView.textField.text ?? ""
        viewModel.appendPerson(person: Person(name: typedText, age: Int.random(in: 1...100)))
        mainView.textField.text = ""
        viewModel.list.bindAndFire { value in
            self.mainView.tableView.reloadData()
        }
    }
    
    private func tableViewConfigure() {
        mainView.tableView.delegate = self
        mainView.tableView.dataSource = self
        mainView.tableView.register(BasicMVVMTableViewCell.self, forCellReuseIdentifier: "BasicMVVMTableViewCell")
    }
}

extension BasicMVVMViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.list.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "BasicMVVMTableViewCell", for: indexPath) as? BasicMVVMTableViewCell else {
            return UITableViewCell()
        }
        cell.setConfigureWithPerson(person: viewModel.list.value[indexPath.row])
        return cell
    }
}
