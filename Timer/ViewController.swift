//
//  ViewController.swift
//  Timer
//
//  Created by PenguinRaja on 07.07.2021.
//

import UIKit

class ViewController: UITableViewController {
    
    private let cellID = "cell"
    var countdownList: [Task] = []
    
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        tableView.register(CountdownCell.self, forCellReuseIdentifier: CountdownCell.myCell)
        tableView.register(FirstCell.self, forCellReuseIdentifier: FirstCell.myCell)
        setupNavigationBar()
        createTimer()
    }

    private func setupNavigationBar() {
        title = "Мульти таймер"
        navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    func createTimer() {
      if timer == nil {
            timer = Timer.scheduledTimer(timeInterval: 1.0,
                                         target: self,
                                         selector: #selector(updateTimer),
                                         userInfo: nil,
                                         repeats: true)
        RunLoop.current.add(timer!, forMode: .common)
      }
    }
}

// MARK: - TableView

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
            FirstCell.countdownList = countdownList
            customCell.delegate = self
            return customCell
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: CountdownCell.myCell, for: indexPath) as! CountdownCell
            cell.task = countdownList[indexPath.row]
            return cell
        }
        
    }
    
    @objc func updateTimer() {
        guard let visibleRowsIndexPaths = tableView.indexPathsForVisibleRows else {
            return
        }
        
        for indexPath in visibleRowsIndexPaths {
            if let cell = tableView.cellForRow(at: indexPath) as? CountdownCell {
                cell.configure()
                if cell.task!.timer <= 0 {
                    countdownList.remove(at: indexPath.row)
                    tableView.reloadData()
                }
            }
        }
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
            return 35
        }
    }
}
