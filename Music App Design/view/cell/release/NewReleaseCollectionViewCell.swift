//
//  NewReleaseCollectionViewCell.swift
//  Music App Design
//
//  Created by Hossam on 8/31/20.
//  Copyright © 2020 Hossam. All rights reserved.
//

import UIKit

class NewReleaseCollectionViewCell: UICollectionViewCell {
    
    

    let post:[String] = ["prof1" , "prof2" , "prof3" ,"prof4" , "prof5" , "prof6"]
    
    lazy var collectionView:UICollectionView = {
        let layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewLayout.init())
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.showsHorizontalScrollIndicator = false
        cv.setCollectionViewLayout(layout, animated: false)
        cv.register(NewSongCollectionViewCell.self, forCellWithReuseIdentifier: "NewSongCollectionViewCell")
        cv.delegate = self
        cv.dataSource = self
        cv.backgroundColor = .clear
        cv.contentInset = UIEdgeInsets(top: 0, left: 17, bottom: 0, right: 17)
        cv.constrainHeight(constant: 80)
        return cv
    }()
    
    lazy var title = UILabel(text: "new releases", font: UIFont(name:"Avenir-Black", size: 25), textColor: .white)
    
    lazy var subTitle = UILabel(text: "3456 songs", font: UIFont(name: "Avenir", size: 18), textColor: .lightGray)
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        
        stack(title,subTitle,collectionView,spacing:10).padLeft(16).padBottom(16)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension NewReleaseCollectionViewCell:UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return post.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewSongCollectionViewCell", for: indexPath) as! NewSongCollectionViewCell
        cell.artistImage.image = UIImage(named: post[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 60, height: 60)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }
    
}

