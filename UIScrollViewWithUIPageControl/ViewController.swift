//
//  ViewController.swift
//  UIScrollViewWithUIPageControl
//
//  Created by Curtis Colly on 11/23/19.
//  Copyright © 2019 Snaap. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var pagesCollectionView: UICollectionView!
    @IBOutlet weak var titlesCollectionView: UICollectionView!
 
    var buttons: [UIButton] = []
    var names = ["Boston Common", "Bunker Hill", "Tea Party Museum", "Something Else",
                 "Boston Common", "Bunker Hill", "Tea Party Museum", "Something Else",
                ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        pagesCollectionView.delegate = self
        pagesCollectionView.dataSource = self
        
        titlesCollectionView.delegate = self
        titlesCollectionView.dataSource = self
        

        
        //videoCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: customCell)
     
        //setupButtons()
        
    }
    
//    func setupButtons() {
//        for index in 0..<6 {
//            let frame = CGRect(x: view.frame.width * CGFloat(index) / 3.5, y: 0, width: (view.frame.width / 6), height: 80.00)
//            let button = UIButton(frame: frame)
//            button.setTitle("testing", for: .normal)
//            button.setTitleColor(.red, for: .normal)
//            button.setTitleColor(.blue, for: .selected)
//            button.backgroundColor = .black
//            button.tag = index
//            button.addTarget(self, action: #selector(buttonWasPressed), for: .touchUpInside)
//            buttons.append(button)
//
//        }
//
//    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
       // setupButtons()
        
    }
    
    @objc func buttonWasPressed(_ sender: UIButton) {
        for button in buttons {
            if sender.tag == button.tag {
                button.isSelected = true
            } else {
                button.isSelected = false
            }
        }
    }
    
}


extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == titlesCollectionView {
            return 20
        }
        
        return names.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
   
        if collectionView == titlesCollectionView {
            let titleCell = titlesCollectionView.dequeueReusableCell(withReuseIdentifier: "TitleCell", for: indexPath)
            titleCell.backgroundColor = .blue
            return titleCell
        }
        
        let pageCell = collectionView.dequeueReusableCell(withReuseIdentifier: "PageCell", for: indexPath)
        pageCell.backgroundColor = .red
        return pageCell
   
    }
 
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
         
        if collectionView == titlesCollectionView {
            return CGSize(width: 50, height: 50)
        }
        
        return CGSize(width: 300, height: 300)
    }
    
}


