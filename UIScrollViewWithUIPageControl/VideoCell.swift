//
//  VideoCell.swift
//  UIScrollViewWithUIPageControl
//
//  Created by Curtis Colly on 12/7/19.
//  Copyright © 2019 Snaap. All rights reserved.
//

import UIKit

class VideoCell: UICollectionViewCell {
    
    static let reuseIdentifier = "VideoCell"
    let cellView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        addSubview(cellView)
        cellView.backgroundColor = .gray
        setupConstraints()
    }
    
    func setupConstraints() {
        cellView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            cellView.leadingAnchor.constraint(equalTo: leadingAnchor),
            cellView.trailingAnchor.constraint(equalTo: trailingAnchor),
            cellView.topAnchor.constraint(equalTo: topAnchor),
            cellView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
    }
    
    
    
    
    
    
    
    
}
