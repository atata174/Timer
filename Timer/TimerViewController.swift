//
//  TimerViewController.swift
//  Timer
//
//  Created by PenguinRaja on 07.07.2021.
//

import UIKit

class TimerViewController: UIViewController {
    
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

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupSubview()
        setConstraints()
    }
    
    @objc private func addTimer() {
        print("Button")
    }
    
    private func setupSubview() {
        view.addSubview(timerTitleTextField)
        view.addSubview(timerCountTextField)
        view.addSubview(addTimerButton)
    }
    
    private func setConstraints() {
        timerTitleTextField.translatesAutoresizingMaskIntoConstraints = false
        timerCountTextField.translatesAutoresizingMaskIntoConstraints = false
        addTimerButton.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            timerTitleTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            timerTitleTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            timerTitleTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
        ])
        
        NSLayoutConstraint.activate([
            timerCountTextField.topAnchor.constraint(equalTo: timerTitleTextField.bottomAnchor, constant: 20),
            timerCountTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            timerCountTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
        ])
        
        NSLayoutConstraint.activate([
            addTimerButton.topAnchor.constraint(equalTo: timerCountTextField.bottomAnchor, constant: 20),
            addTimerButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            addTimerButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
        ])
    }

}
