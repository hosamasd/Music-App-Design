//
//  NewSongCollectionViewCell.swift
//  Music App Design
//
//  Created by Hossam on 8/31/20.
//  Copyright © 2020 Hossam. All rights reserved.
//


import UIKit

class NewSongCollectionViewCell: UICollectionViewCell {
    
    lazy var artistImage:UIImageView = {
        let img = UIImageView(image:  UIImage(named:"img1"))
        img.contentMode = .scaleAspectFill
        img.clipsToBounds = true
        img.layer.cornerRadius = 30
        return img
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        stack(artistImage)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
