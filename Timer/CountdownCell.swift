//
//  CountdownCell.swift
//  Timer
//
//  Created by PenguinRaja on 08.07.2021.
//

import UIKit

class CountdownCell: UITableViewCell {

    var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        
        return label
    }()
    
    var timerCountLabel: UILabel = {
        let timer = UILabel()
        timer.textColor = .lightGray
        
        return timer
    }()
    
    var task: Task? {
      didSet {
        titleLabel.text = task?.name
      }
    }
    
    static let myCell = "secondCell"
    var timerCounter: Timer?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(titleLabel)
        contentView.addSubview(timerCountLabel)
    }
    
    // Update cell
    func configure() {
        task?.timer -= 1
        guard let counter = task?.timer else { return }
        print(counter)
        let minutes = Int(counter) / 60 % 60
        let seconds = Int(counter) % 60
        timerCountLabel.text = String(format: "%02i:%02i", minutes, seconds)
    
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        titleLabel.frame = CGRect(
            x: 15,
            y: 0,
            width: contentView.frame.size.width - 40,
            height: 30)
        
        timerCountLabel.frame = CGRect(
            x: contentView.frame.size.width - 80,
            y: 0,
            width: contentView.frame.size.width - 40,
            height: 30)

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
