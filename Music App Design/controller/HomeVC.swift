//
//  ViewController.swift
//  Music App Design
//
//  Created by Hossam on 8/31/20.
//  Copyright © 2020 Hossam. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {

    //MARK:- Bottom Music Bar
       
       lazy var bottomMusicBar:BottomMusicBar = {
           let v = BottomMusicBar()
           v.translatesAutoresizingMaskIntoConstraints = false
           v.backgroundColor = CustomColors.appBackLight
           v.layer.cornerRadius = 20
           v.layer.maskedCorners = [.layerMaxXMinYCorner]
        v.constrainHeight(constant: 140)
           return v
       }()
       
       lazy var collectionView:UICollectionView = {
           let layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
           layout.scrollDirection = .vertical
           let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewLayout.init())
           cv.translatesAutoresizingMaskIntoConstraints = false
           cv.showsVerticalScrollIndicator = false
           cv.backgroundColor = .clear
           cv.setCollectionViewLayout(layout, animated: false)
           cv.register(PopularPlaylistCollectionViewCell.self, forCellWithReuseIdentifier: "PopularPlaylistCollectionViewCell")
//           cv.register(NewReleaseCollectionViewCell.self, forCellWithReuseIdentifier: "NewReleaseCollectionViewCell")
           cv.delegate = self
           cv.dataSource = self
           return cv
       }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupViews()
        setUpNavigationBar()

    }

    func setupViews()  {
        
    view.backgroundColor = CustomColors.appBackDark
        view.addSubViews(views: collectionView,bottomMusicBar)
        
        bottomMusicBar.anchor(top: nil, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor)
        collectionView.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: bottomMusicBar.topAnchor, trailing: view.trailingAnchor)
            
        
    }

    func setUpNavigationBar(){
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.barTintColor = CustomColors.appBackDark
        navigationController?.navigationBar.isTranslucent = false
        
        let titleLabel = UILabel()
        let attributedText = NSMutableAttributedString(string:"Hello, Yana\n" , attributes:[NSAttributedString.Key.font: UIFont(name: "Avenir-Black", size: 16)!])
        attributedText.append(NSAttributedString(string: "New York" , attributes:
            [NSAttributedString.Key.font: UIFont(name: "Avenir", size: 12)!, NSAttributedString.Key.foregroundColor: UIColor.white]))
        titleLabel.numberOfLines = 0
        titleLabel.attributedText = attributedText
        titleLabel.textColor = .white
        titleLabel.sizeToFit()
        let RightTitleItem = UIBarButtonItem(customView: titleLabel)
        self.navigationItem.rightBarButtonItem = RightTitleItem
        
        let notifButton = UIButton(type: .custom)
        notifButton.setImage(UIImage(named: "notification")?.withRenderingMode(.alwaysTemplate), for: .normal)
        notifButton.tintColor = .white
        notifButton.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: notifButton)
        let rightBarButtonItem = UIBarButtonItem()
        rightBarButtonItem.customView = notifButton

        navigationItem.setRightBarButtonItems([rightBarButtonItem , RightTitleItem], animated: true)
        
        let moreButton = UIButton(type: .custom)
        moreButton.setImage(UIImage(named: "moreBtn")?.withRenderingMode(.alwaysTemplate), for: .normal)
        moreButton.tintColor = .white
        moreButton.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: moreButton)
        let leftBarButtonItem = UIBarButtonItem()
        leftBarButtonItem.customView = moreButton

        navigationItem.setLeftBarButton(leftBarButtonItem, animated: true)
    }
}


extension HomeVC:UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, PlaylistProtocol {
    
    func playlistTapped() {
//        let VC = DetailViewController()
//        navigationController?.pushViewController(VC, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PopularPlaylistCollectionViewCell", for: indexPath) as! PopularPlaylistCollectionViewCell
            cell.delegate = self
            return cell
        }
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewReleaseCollectionViewCell", for: indexPath) as! NewReleaseCollectionViewCell
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.row == 0{
            return CGSize(width: collectionView.frame.width, height: 500)
        }
        return CGSize(width: collectionView.frame.width, height: 180)
    }
    
}
