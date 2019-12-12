//
//  PageCell.swift
//  UIScrollViewWithUIPageControl
//
//  Created by Curtis Colly on 12/7/19.
//  Copyright © 2019 Snaap. All rights reserved.
//
// ["Rock", "Classical", "Hip hop", "Rap", "Rhythym and Blues",
// "Jazz", "Instrumental", "Alternative", "Electronic"]

import UIKit


class PageCell: UICollectionViewCell {
    static let reuseIdentifier = "PageCell"
    var dataArray = [[String]]()

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
        // This is like viewDidLoad
    }
    
    func setupView() {
        createViewHierarchy()
        setupColors()
        prepareForAutoLayout()
        setupContraints()
        setupCollectionView()
        setupData()
    }
    
    func createViewHierarchy() {
        addSubview(coreView)
        coreView.addSubview(videosCollectionView)
    }
    
    func setupColors() {
        coreView.backgroundColor = .red
        videosCollectionView.backgroundColor = .systemOrange
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
    
    func setupData() {
        let dataA = ["Rock", "Classical", "Hip Hop"]
        let dataB = ["Rap", "Rhythm and Blues", "Jazz"]
        let dataC = ["Instrumental", "Alternative", "Electronic"]

        // then add them all to the "data" array
        dataArray.append(dataA)
        dataArray.append(dataB)
        dataArray.append(dataC)
        
    }
}

extension PageCell: UICollectionViewDataSource, UICollectionViewDelegate {
    
    // These Methods are for the videos collection view
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = videosCollectionView.dequeueReusableCell(withReuseIdentifier: "VideoCell", for: indexPath) as! VideoCell
        cell.backgroundColor = .systemGreen
        cell.label.text = dataArray[0][indexPath.row]
        return cell
    }

}


extension PageCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

      
        return CGSize(width: 100, height: 100)
        
    }

}
