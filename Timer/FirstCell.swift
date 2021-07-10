//
//  FirstCell.swift
//  Timer
//
//  Created by PenguinRaja on 08.07.2021.
//

import UIKit

class FirstCell: UITableViewCell {
    
    static let myCell = "firstCell"
    static var countdownList: [Task] = []
    var delegate: ViewController?
    
    private lazy var timerTitleTextField: UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "Название таймера"
        textfield.borderStyle = .roundedRect
        return textfield
    } ()

    private lazy var timerCountTextField: UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "Время в секундах"
        textfield.borderStyle = .roundedRect
        textfield.keyboardType = .numberPad
        return textfield
    } ()

    private lazy var addTimerButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .secondarySystemBackground
        button.setTitle("Добавить", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(addTimer), for: .touchUpInside)

        return button
    } ()


    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(timerTitleTextField)
        contentView.addSubview(timerCountTextField)
        contentView.addSubview(addTimerButton)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        timerTitleTextField.frame = CGRect(
            x: 10,
            y: 30,
            width: contentView.frame.size.width - 40,
            height: 30)
        
        timerCountTextField.frame = CGRect(
            x: 10,
            y: 80,
            width: contentView.frame.size.width - 40,
            height: 30)
        
        addTimerButton.frame = CGRect(
            x: 10,
            y: 130,
            width: contentView.frame.size.width - 30,
            height: 50)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func addTimer() {
        guard let title = timerTitleTextField.text else { return }
        guard let timerTF = timerCountTextField.text else { return }
        
        let timer = Int(timerTF) ?? 0
        
        delegate?.countdownList.append(Task(name: title, timer: timer))
        delegate?.tableView.reloadData()
    }
    
    
}
