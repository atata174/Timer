//
//  CountdownCell.swift
//  Timer
//
//  Created by PenguinRaja on 08.07.2021.
//

import UIKit

class CountdownCell: UITableViewCell {
    
    static let myCell = "myIdentifiery"

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .systemTeal
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
