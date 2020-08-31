//
//  BottomMusicBar.swift
//  Music App Design
//
//  Created by Hossam on 8/31/20.
//  Copyright © 2020 Hossam. All rights reserved.
//


import UIKit

class BottomMusicBar: UIView {
    
    lazy var overView:UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    lazy var songImage:UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.layer.cornerRadius = 25
        img.image = UIImage(named: "img2")
        img.contentMode = .scaleAspectFill
        img.clipsToBounds = true
        img.constrainWidth(constant: 50)
//        img.constrainHeight(constant: 50)
        return img
    }()
    
    lazy var songDetails:UILabel = {
        let l = UILabel()
        l.textColor = .white
        l.numberOfLines = 0
        let attributedText = NSMutableAttributedString(string:"idk\n" , attributes:[NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17)])
        attributedText.append(NSAttributedString(string: "let you" , attributes:
            [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15), NSAttributedString.Key.foregroundColor: UIColor.lightGray]))
        l.attributedText = attributedText
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    lazy var stackView:UIStackView = {
        let v = UIStackView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.axis = .horizontal
        v.spacing = 0
        v.distribution = .fillEqually
        return v
    }()
    
    lazy var playView:UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    lazy var playImage:UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFit
        img.clipsToBounds = true
        img.image = UIImage(systemName: "pause")?.withRenderingMode(.alwaysTemplate)
        img.tintColor = .white
        img.constrainWidth(constant: 25)
        
        return img
    }()
    
    lazy var forwardView:UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    lazy var forwardImage:UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFit
        img.clipsToBounds = true
        img.image = UIImage(systemName: "forward")?.withRenderingMode(.alwaysTemplate)
        img.tintColor = .white
        img.constrainWidth(constant: 25)
        return img
    }()
    
    lazy var startTimer:UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.text = "01:20"
        l.textColor = .lightGray
        l.font = UIFont(name: "Avenir-Heavy", size: 12)
//        l.constrainHeight(constant: 30)
        return l
    }()
    
    lazy var endTimer:UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.text = "03:45"
        l.textColor = .white
        l.font = UIFont(name: "Avenir-Heavy", size: 12)
        l.textAlignment = .right
        return l
    }()
    
    lazy var progressView:UIProgressView = {
        let pv = UIProgressView()
        pv.translatesAutoresizingMaskIntoConstraints = false
        pv.progressTintColor = .white
        pv.trackTintColor = CustomColors.appBackDark
        pv.setProgress(0.5, animated: false)
        pv.constrainHeight(constant: 3)
        return pv
    }()
    lazy var topStack:UIStackView = {
        let v =         getStack(views: songImage,songDetails,playImage,forwardImage, spacing: 16, distribution: .fill, axis: .horizontal)
        
        return v
    }()
    lazy var bottomStack:UIStackView = {
        let ss = getStack(views: UIView(),progressView,UIView(), spacing: 16, distribution: .fill, axis: .vertical)
        let v =                 getStack(views: startTimer,ss,endTimer, spacing: 16, distribution: .fill, axis: .horizontal)
        
        
        return v
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        stack(topStack,bottomStack,spacing:8).withMargins(.init(top: 16, left: 16, bottom: 8, right: 16))
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
