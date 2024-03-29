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
    var pageNumber: Int?

    let coreView = UIView()
    private let layout = UICollectionViewFlowLayout()
    
    // The rect's values will be overriden by the constraint
    lazy var videosCollectionView = VideosCollectionView(frame: .zero, collectionViewLayout: layout)
    
//    required init?(coder: NSCoder) {
//        super.init(coder: coder)
    
//        setupView()
//
//    }
    
    
    
    // This is like viewDidLoad
    override init(frame: CGRect) {
        super.init(frame: frame)
        print("")
        setupView()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
        let data0 = ["Rock", "Classical", "Hip Hop"]
        let data1 = ["Rap", "Techno", "Jazz"]
        let data2 = ["Instrumental", "Alternative", "Electronic"]
        let data3 = ["Orchestra", "Baroque", "Opera"]
        let data4 = ["Pop", "Singing", "Acapella"]

        // then add them all to the "data" array
        dataArray.append(data0)
        dataArray.append(data1)
        dataArray.append(data2)
        dataArray.append(data3)
        dataArray.append(data4)
        
    }
}

extension PageCell: UICollectionViewDataSource, UICollectionViewDelegate {
    
    // These Methods are for the videos collection view
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = videosCollectionView.dequeueReusableCell(withReuseIdentifier: "VideoCell", for: indexPath) as? VideoCell else { fatalError("Cannot dequeue VideoCell.") }
        
        if let pageNumber = pageNumber {
            cell.backgroundColor = .systemGreen
            cell.layer.borderWidth = 2
            cell.layer.cornerRadius = 10
            cell.layer.borderColor = UIColor.blue.cgColor
            cell.label.text = dataArray[pageNumber][indexPath.item]
            
        }
        
        return cell
    }

}

extension PageCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(width: 100, height: 100)
        
    }

}
