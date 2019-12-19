//
//  ViewController.swift
//  UIScrollViewWithUIPageControl
//
//  Created by Curtis Colly on 11/23/19.
//  Copyright © 2019 Snaap. All rights reserved.
//
import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    let coreView = UIView()
    let topView = UIView()
    let mainView = UIView()
    let bottomView = UIView()

    // The frame measurements do NOT matter here
    var titlesCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    var pagesCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())

    var names = ["California", "Connecticut", "Michigan", "Massachusetts", "Louisiana"]
    var selectedIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let pagesLayout = UICollectionViewFlowLayout()
        pagesLayout.scrollDirection = .horizontal
        
        let titlesLayout = UICollectionViewFlowLayout()
        titlesLayout.scrollDirection = .horizontal
        
        titlesCollectionView.collectionViewLayout = titlesLayout
        pagesCollectionView.collectionViewLayout = pagesLayout
        

        setupView()
        
    }
    
    func setupView() {
        createViewHierarchy()
        setupColors()
        prepareForAutoLayout()
        setupContraints()
        setupCollectionViews()
    }
    
    func setupColors() {
        view.backgroundColor = .white
        coreView.backgroundColor = .yellow // Does NOT show up
        topView.backgroundColor = .red
        mainView.backgroundColor = .blue
        bottomView.backgroundColor = .systemYellow
        
        titlesCollectionView.backgroundColor = .purple
        pagesCollectionView.backgroundColor = .systemYellow
    }
    
    func createViewHierarchy() {
        view.addSubview(coreView) // Yellow Does NOT show up
        coreView.addSubview(topView) // Red
        coreView.addSubview(mainView) // Blue does NOT show up
        coreView.addSubview(bottomView) // Green
        
        topView.addSubview(titlesCollectionView)
        mainView.addSubview(pagesCollectionView)
    }
    
    func prepareForAutoLayout() {
        for eachView in [coreView, topView, mainView, bottomView, titlesCollectionView, pagesCollectionView] {
            eachView.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    func setupContraints() {
        let guide = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            coreView.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
            coreView.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
            coreView.topAnchor.constraint(equalTo: guide.topAnchor),
            coreView.bottomAnchor.constraint(equalTo: guide.bottomAnchor),
            
            topView.leadingAnchor.constraint(equalTo: coreView.leadingAnchor),
            topView.trailingAnchor.constraint(equalTo: coreView.trailingAnchor),
            topView.topAnchor.constraint(equalTo: coreView.topAnchor),
            topView.heightAnchor.constraint(equalToConstant: 100),
            
            bottomView.leadingAnchor.constraint(equalTo: coreView.leadingAnchor, constant: 10),
            bottomView.trailingAnchor.constraint(equalTo: coreView.trailingAnchor, constant: -10),
            bottomView.bottomAnchor.constraint(equalTo: coreView.bottomAnchor, constant: 10),
            bottomView.heightAnchor.constraint(equalToConstant: 100),
            
            mainView.leadingAnchor.constraint(equalTo: coreView.leadingAnchor),
            mainView.trailingAnchor.constraint(equalTo: coreView.trailingAnchor),
            mainView.topAnchor.constraint(equalTo: topView.bottomAnchor),
            mainView.bottomAnchor.constraint(equalTo: coreView.bottomAnchor),
            
            titlesCollectionView.leadingAnchor.constraint(equalTo: topView.leadingAnchor),
            titlesCollectionView.trailingAnchor.constraint(equalTo: topView.trailingAnchor),
            titlesCollectionView.topAnchor.constraint(equalTo: topView.topAnchor),
            titlesCollectionView.bottomAnchor.constraint(equalTo: topView.bottomAnchor),
            
            pagesCollectionView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor),
            pagesCollectionView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor),
            pagesCollectionView.topAnchor.constraint(equalTo: mainView.topAnchor),
            pagesCollectionView.bottomAnchor.constraint(equalTo: mainView.bottomAnchor),
            
        ])
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        setupView()
        
    }
    
    func setupCollectionViews() {
        titlesCollectionView.register(TitleCell.self, forCellWithReuseIdentifier: TitleCell.reuseIdentifier)
        pagesCollectionView.register(PageCell.self, forCellWithReuseIdentifier: PageCell.reuseIdentifier)
    
        titlesCollectionView.delegate = self
        titlesCollectionView.dataSource = self
        
        pagesCollectionView.delegate = self
        pagesCollectionView.dataSource = self
        pagesCollectionView.isPagingEnabled = true
        
    }
    
    @objc func swipeLeft() {
        print("Swiped Left 🏓")
    }
    
}


extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return names.count
      
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        if collectionView == titlesCollectionView {
            let titleCell = titlesCollectionView.dequeueReusableCell(withReuseIdentifier: "TitleCell", for: indexPath) as! TitleCell
            titleCell.backgroundColor = .blue
            titleCell.layer.borderWidth = 0.0
            titleCell.label.text = names[indexPath.row]
            
            titleCell.backgroundColor = selectedIndex == indexPath.row ? UIColor.systemGreen : UIColor.blue
            
            return titleCell
        }

        // Pages Collection View
        let pageCell = collectionView.dequeueReusableCell(withReuseIdentifier: "PageCell", for: indexPath) as! PageCell
        pageCell.pageNumber = indexPath.item
        return pageCell

    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            titlesCollectionView.scrollToItem(at: indexPath, at: .left, animated: true)
            pagesCollectionView.scrollToItem(at: indexPath, at: .left, animated: true)
        
            selectedIndex = indexPath.row

            titlesCollectionView.reloadData()
        
    }
    
//    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
//        //if scrollView.panGestureRecognizer.translation(in: scrollView).x < mainView.frame.width {}
//
//
//
//    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageWidth = pagesCollectionView.frame.width
        let page = Int(floor(pagesCollectionView.contentOffset.x / pageWidth))
        
        titlesCollectionView.scrollToItem(at: [0, page], at: .left, animated: true)
        selectedIndex = page
        titlesCollectionView.reloadData()
        
    }
    
    
    
   
   
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {

        if collectionView == titlesCollectionView {
            return 10
        }
        
        // Pages Collection View
        return 0

    }
    

}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        if collectionView == titlesCollectionView {
            return CGSize(width: 12 * names[indexPath.item].count, height: 50)
        }

        // Pages Collection View
        return CGSize(width: mainView.frame.width, height: mainView.frame.height)
        
    }

}


