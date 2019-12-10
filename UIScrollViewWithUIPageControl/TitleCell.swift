//
//  TitleCellCollectionViewCell.swift
//  UIScrollViewWithUIPageControl
//
//  Created by Curtis Colly on 12/8/19.
//  Copyright © 2019 Snaap. All rights reserved.
//

import UIKit

class TitleCell: UICollectionViewCell {
    static let reuseIdentifier = "TitleCell"
    let cellView = UIView()
    // The width is set dynamically
    let label = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 20))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        label.sizeToFit()
        
        label.numberOfLines = 1
        label.textColor = .white
        label.textAlignment = .center
     
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
    }
    
    func setupView() {
        cellView.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        addSubview(cellView)
        cellView.addSubview(label)
        
        NSLayoutConstraint.activate([
            cellView.leadingAnchor.constraint(equalTo: leadingAnchor),
            cellView.topAnchor.constraint(equalTo: topAnchor),
            cellView.trailingAnchor.constraint(equalTo: trailingAnchor),
            cellView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            label.leadingAnchor.constraint(equalTo: leadingAnchor),
            label.topAnchor.constraint(equalTo: topAnchor),
            label.trailingAnchor.constraint(equalTo: trailingAnchor),
            label.bottomAnchor.constraint(equalTo: bottomAnchor),
  
        ])
    }
    
}
