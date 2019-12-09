//
//  VideoCollectionView.swift
//  UIScrollViewWithUIPageControl
//
//  Created by Curtis Colly on 12/7/19.
//  Copyright © 2019 Snaap. All rights reserved.
//

import UIKit

class VideosCollectionView: UICollectionView, UICollectionViewDataSource, UICollectionViewDelegate {
    
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.dequeueReusableCell(withReuseIdentifier: "VideoCell", for: indexPath)
        cell.backgroundColor = .green
        return cell
    }

}
