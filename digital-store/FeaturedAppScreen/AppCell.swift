//
//  AppCell.swift
//  digital-store
//
//  Created by ADELU ABIDEEN ADELEYE on 10/10/18.
//  Copyright © 2018 Spantom Technologies Ltd. All rights reserved.
//

import UIKit

class AppCell: BaseCell {
    
    var app: App? {
        didSet {
            
            if let name = app?.Name {
                nameLabel.text = name
                
            }
            
            categoryLabel.text = app?.Category
            
            if let price = app?.Price {
                priceLabel.text = "$\(price)"
            } else {
                priceLabel.text = ""
            }
            
            if let imageName = app?.ImageName {
                imageView.image = UIImage(named: imageName)
            }
            
        }
    }
    
    let imageView: UIImageView = {
        let image = UIImage(named: "frozen")
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 16
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.systemFont(ofSize: 14)
        label.text = "Disney Build It: Frozen"
        label.numberOfLines = 2
        return label
    }()
    
    let categoryLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.systemFont(ofSize: 13)
        label.text = "Entertainment"
        label.textColor = .darkGray
        return label
    }()
    
    let priceLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.systemFont(ofSize: 13)
        label.text = "$3.99"
        label.textColor = UIColor.darkGray
        return label
    }()
    
    
    override func setupViews() {
        
        super.setupViews()
        
        addSubview(imageView)
        addSubview(nameLabel)
        addSubview(categoryLabel)
        addSubview(priceLabel)
        
        imageView.setAnchor(width: frame.width, height: frame.width)
        nameLabel.setAnchor(top: imageView.bottomAnchor, topPad: 2, bottom: nil, bottomPad: 0, left: imageView.leftAnchor, leftPad: 0, right: imageView.rightAnchor, rightPad: 0, height: 0, width: frame.width)
        categoryLabel.setAnchor(top: nameLabel.bottomAnchor, topPad: 1, bottom: nil, bottomPad: 0, left: imageView.leftAnchor, leftPad: 0, right: imageView.rightAnchor, rightPad: 0, height: 0, width: frame.width)
        priceLabel.setAnchor(top: categoryLabel.bottomAnchor, topPad: 1, bottom: nil, bottomPad: 0, left: imageView.leftAnchor, leftPad: 0, right: imageView.rightAnchor, rightPad: 0, height: 0, width: frame.width)
        
    }
    
}
