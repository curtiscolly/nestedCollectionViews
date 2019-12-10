//
//  PageCell.swift
//  UIScrollViewWithUIPageControl
//
//  Created by Curtis Colly on 12/7/19.
//  Copyright © 2019 Snaap. All rights reserved.
//

import UIKit


class PageCell: UICollectionViewCell {
    static let reuseIdentifier = "PageCell"
    
    let coreView = UIView()
    private let layout = UICollectionViewFlowLayout()
    
    // The rect's values will be overriden by the constraint
    lazy var videosCollectionView = VideosCollectionView(frame: .zero, collectionViewLayout: layout)
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    func setupView() {
        createViewHierarchy()
        setupColors()
        prepareForAutoLayout()
        setupContraints()
        setupCollectionView()
    }
    
    func setupColors() {
        coreView.backgroundColor = .red
        videosCollectionView.backgroundColor = .orange
    }
    
    func createViewHierarchy() {
        addSubview(coreView)
        coreView.addSubview(videosCollectionView)
    }
    

    func prepareForAutoLayout() {
        for eachView in [coreView, videosCollectionView] {
            eachView.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    func setupContraints() {
        NSLayoutConstraint.activate([
            coreView.leadingAnchor.constraint(equalTo: leadingAnchor),
            coreView.trailingAnchor.constraint(equalTo: trailingAnchor),
            coreView.topAnchor.constraint(equalTo: topAnchor),
            coreView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            videosCollectionView.leadingAnchor.constraint(equalTo: coreView.leadingAnchor),
            videosCollectionView.trailingAnchor.constraint(equalTo: coreView.trailingAnchor),
            videosCollectionView.topAnchor.constraint(equalTo: coreView.topAnchor),
            videosCollectionView.bottomAnchor.constraint(equalTo: coreView.bottomAnchor),
        ])
    }
    
    func setupCollectionView() {
        videosCollectionView.register(VideoCell.self, forCellWithReuseIdentifier: VideoCell.reuseIdentifier)
        
        videosCollectionView.delegate = self
        videosCollectionView.dataSource = self
    }
}

extension PageCell: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = videosCollectionView.dequeueReusableCell(withReuseIdentifier: "VideoCell", for: indexPath)
        cell.backgroundColor = .green
        return cell
    }
    
}
