//
//  AppCell.swift
//  digital-store
//
//  Created by ADELU ABIDEEN ADELEYE on 10/10/18.
//  Copyright © 2018 Spantom Technologies Ltd. All rights reserved.
//

import UIKit

class AppCell: UICollectionViewCell {
    
    let imageView: UIImageView = {
        let image = UIImage(named: "frozen")
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 16
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.systemFont(ofSize: 13)
        label.text = "Disney Build It: Frozen"
        label.numberOfLines = 2
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    func setupViews() {
        addSubview(imageView)
        addSubview(nameLabel)
        
        imageView.setAnchor(width: frame.width, height: frame.width)
        nameLabel.setAnchor(top: imageView.bottomAnchor, topPad: 2, bottom: nil, bottomPad: 0, left: imageView.leftAnchor, leftPad: 0, right: imageView.rightAnchor, rightPad: 0, height: 40, width: frame.width)
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
