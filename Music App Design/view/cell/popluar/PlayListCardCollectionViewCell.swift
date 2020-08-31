//
//  PlayListCardCollectionViewCell.swift
//  Music App Design
//
//  Created by Hossam on 8/31/20.
//  Copyright © 2020 Hossam. All rights reserved.
//

import UIKit

class PlayListCardCollectionViewCell: UICollectionViewCell {
    
    
 var data:PlaylistData? {
        didSet{
            manageData()
        }
    }
    
    lazy var playListCard:UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .clear
        v.layer.cornerRadius = 15
        v.layer.shadowColor = UIColor.systemPink.cgColor
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
     lazy var cardImage:UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.layer.cornerRadius = 15
        img.clipsToBounds = true
        img.contentMode = .scaleAspectFill
        img.isUserInteractionEnabled = true
        return img
    }()
    
     lazy var addButton:UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "selected"), for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        btn.layer.shadowOpacity = 0.6
        btn.layer.shadowRadius = 8
        btn.layer.masksToBounds = false
        btn.layer.cornerRadius = 20
        btn.constrainWidth(constant: 40)
        btn.constrainHeight(constant: 40)
        return btn
    }()
    
     lazy var cardDetails:UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.numberOfLines = 0
        l.textColor = .white
        return l
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubViews(views: cardImage,addButton)
        cardImage.fillSuperview()
        let ss = stack(UIView(),cardDetails)
        cardImage.stack(UIView(),ss).withMargins(.init(top: 60, left: 16, bottom: 16, right: 0))
        addButton.anchor(top: topAnchor, leading: nil, bottom: nil, trailing: trailingAnchor,padding: .init(top: 60, left: 0, bottom: 0, right: -20))
    }
    
    func manageData(){
        guard let data = data else {return}
        cardImage.image = UIImage(named: data.img)
        if data.selected{
            addButton.setImage(UIImage(named: "selected"), for: .normal)
            addButton.layer.shadowColor = UIColor.black.cgColor
        } else {
            addButton.setImage(UIImage(named: "add"), for: .normal)
            addButton.layer.shadowColor = CustomColors.appRed.cgColor
        }
        setUpAttributeValue()
    }
    
    func setUpAttributeValue(){
        guard let data = data else { return }
        let attributedText = NSMutableAttributedString(string:"\(data.song ?? "")\n" , attributes:[NSAttributedString.Key.font: UIFont(name: "Avenir-Black", size: 17)!])
        attributedText.append(NSAttributedString(string: "\(data.artist ?? "")" , attributes:
            [NSAttributedString.Key.font: UIFont(name: "Avenir", size: 14)!, NSAttributedString.Key.foregroundColor: UIColor.white]))
        cardDetails.attributedText = attributedText
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

