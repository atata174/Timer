//
//  ViewController.swift
//  Timer
//
//  Created by PenguinRaja on 07.07.2021.
//

import UIKit

class ViewController: UITableViewController {
    
    private let cellID = "cell"
    private var countdownList: [String] = ["one","two","three"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        tableView.register(CountdownCell.self, forCellReuseIdentifier: CountdownCell.myCell)
        tableView.register(FirstCell.self, forCellReuseIdentifier: FirstCell.myCell)
        
        setupNavigationBar()
        
    }

    private func setupNavigationBar() {
        title = "Мульти таймер"
        navigationController?.navigationBar.prefersLargeTitles = false
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(secondPage))
    }
    
    @objc private func secondPage() {
        let second = TimerViewController()
        present(second, animated: true)
    }
    
}

extension ViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        else {
            return countdownList.count
        }
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let customCell = tableView.dequeueReusableCell(withIdentifier: FirstCell.myCell, for: indexPath) as! FirstCell
            return customCell
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: CountdownCell.myCell, for: indexPath) as! CountdownCell
            return cell
        }
        
        
//        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
//        return cell
//        var content = cell.defaultContentConfiguration()
//        let count = countdownList[indexPath.row]
//        content.text = count
//        cell.contentConfiguration = content
//
//        let customCell = tableView.dequeueReusableCell(withIdentifier: FirstCell.myCell, for: indexPath) as! FirstCell
//        var content = customCell.defaultContentConfiguration()
//        let count = countdownList[indexPath.row]
//        content.text = count
//        customCell.contentConfiguration = content
//        print(customCell.description)
//        return customCell
//
//        switch (indexPath.section){
//        case 0:
//            return customCell
//        case 1:
//            return cell
//        default:
//            break
//        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Добавление таймеров"
        } else {
            return "Таймеры"
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 200
        } else {
            return 30
        }
    }
}
