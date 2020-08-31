//
//  PopularPlaylistCollectionViewCell.swift
//  Music App Design
//
//  Created by Hossam on 8/31/20.
//  Copyright © 2020 Hossam. All rights reserved.
//

import UIKit


struct PlaylistData {
    let img:String!
    let song:String!
    let artist:String!
    let selected:Bool!
    let shadowColor:UIColor!
}

protocol PlaylistProtocol {
    func playlistTapped()
}

class PopularPlaylistCollectionViewCell: UICollectionViewCell {
    
    
    var delegate:PlaylistProtocol?
    
    var playList:[PlaylistData] = [
        PlaylistData(img: "img1", song: "Like it doesn't hurt", artist: "Charlo cardin" , selected: false , shadowColor: CustomColors.appRed),
        PlaylistData(img: "img2", song: "Love on the brain", artist: "Tvorchi", selected: true , shadowColor: CustomColors.appRed)
    ]
    
    lazy var title:UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        let titleText = "most popular"
        let paragraphStyle = NSMutableParagraphStyle()
        //line height size
        paragraphStyle.lineSpacing = 1
        let attrString = NSMutableAttributedString(string: titleText)
        attrString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attrString.length))
        
        l.font = UIFont(name:"Avenir-Black", size: 40)
        l.textColor = .white
        l.attributedText = attrString
        l.numberOfLines=0
        l.constrainWidth(constant: 180)
        return l
    }()
    
    lazy var subTitle = UILabel(text: "960 playlists", font:  UIFont(name: "Avenir", size: 18), textColor: .lightGray,  numberOfLines: 0)
    
    lazy var collectionView:UICollectionView = {
        let layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewLayout.init())
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.showsHorizontalScrollIndicator = false
        cv.setCollectionViewLayout(layout, animated: false)
        cv.register(PlayListCardCollectionViewCell.self, forCellWithReuseIdentifier: "PlayListCardCollectionViewCell")
        cv.delegate = self
        cv.dataSource = self
        cv.backgroundColor = .clear
//        cv.contentInset = UIEdgeInsets(top: 0, left: 17, bottom: 0, right: 17)
        return cv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
      let ss =  hstack(title,UIView())
        stack(ss,subTitle,collectionView).withMargins(.init(top: 8, left: 16, bottom: 16, right: 16))
        
    }
    
   
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension PopularPlaylistCollectionViewCell:UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return playList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PlayListCardCollectionViewCell", for: indexPath) as! PlayListCardCollectionViewCell
        cell.data = playList[indexPath.row]
//        cell.backgroundColor = .red
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.playlistTapped()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.width) / 2, height: 300)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 32
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
}

