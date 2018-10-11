//
//  AppCell.swift
//  digital-store
//
//  Created by ADELU ABIDEEN ADELEYE on 10/10/18.
//  Copyright © 2018 Spantom Technologies Ltd. All rights reserved.
//

import UIKit

class AppCell: UICollectionViewCell {
    
    var app: App? {
        didSet {
            
            if let name = app?.name {
                nameLabel.text = name
                
//                let rect = NSString(string: name).boundingRect(with: CGSize(width: frame.width, height: 1000), options: NSStringDrawingOptions.usesFontLeading.union(NSStringDrawingOptions.usesLineFragmentOrigin), attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)], context: nil)
//
//                if rect.height > 20 {
//
//                    nameLabel.setAnchor(top: imageView.bottomAnchor, topPad: 2, bottom: nil, bottomPad: 0, left: imageView.leftAnchor, leftPad: 0, right: imageView.rightAnchor, rightPad: 0, height: 40, width: frame.width)
//                    nameLabel.sizeToFit()
//
//                    categoryLabel.setAnchor(top: nameLabel.bottomAnchor, topPad: 1, bottom: nil, bottomPad: 0, left: imageView.leftAnchor, leftPad: 0, right: imageView.rightAnchor, rightPad: 0, height: 20, width: frame.width)
//                    priceLabel.setAnchor(top: categoryLabel.bottomAnchor, topPad: 1, bottom: nil, bottomPad: 0, left: imageView.leftAnchor, leftPad: 0, right: imageView.rightAnchor, rightPad: 0, height: 20, width: frame.width)
//                } else {
//                    nameLabel.setAnchor(top: imageView.bottomAnchor, topPad: 2, bottom: nil, bottomPad: 0, left: imageView.leftAnchor, leftPad: 0, right: imageView.rightAnchor, rightPad: 0, height: 20, width: frame.width)
//                    nameLabel.sizeToFit()
//
//                    categoryLabel.setAnchor(top: nameLabel.bottomAnchor, topPad: 1, bottom: nil, bottomPad: 0, left: imageView.leftAnchor, leftPad: 0, right: imageView.rightAnchor, rightPad: 0, height: 20, width: frame.width)
//                    priceLabel.setAnchor(top: categoryLabel.bottomAnchor, topPad: 1, bottom: nil, bottomPad: 0, left: imageView.leftAnchor, leftPad: 0, right: imageView.rightAnchor, rightPad: 0, height: 20, width: frame.width)
//                }
                
            }
            
            categoryLabel.text = app?.category
            
            if let price = app?.price {
                priceLabel.text = "$\(price)"
            } else {
                priceLabel.text = ""
            }
            
            if let imageName = app?.imageName {
                imageView.image = UIImage(named: imageName)
            }
            
        }
    }
    
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    func setupViews() {
        addSubview(imageView)
        addSubview(nameLabel)
        addSubview(categoryLabel)
        addSubview(priceLabel)
        
        imageView.setAnchor(width: frame.width, height: frame.width)
        nameLabel.setAnchor(top: imageView.bottomAnchor, topPad: 2, bottom: nil, bottomPad: 0, left: imageView.leftAnchor, leftPad: 0, right: imageView.rightAnchor, rightPad: 0, height: 0, width: frame.width)
        categoryLabel.setAnchor(top: nameLabel.bottomAnchor, topPad: 1, bottom: nil, bottomPad: 0, left: imageView.leftAnchor, leftPad: 0, right: imageView.rightAnchor, rightPad: 0, height: 0, width: frame.width)
        priceLabel.setAnchor(top: categoryLabel.bottomAnchor, topPad: 1, bottom: nil, bottomPad: 0, left: imageView.leftAnchor, leftPad: 0, right: imageView.rightAnchor, rightPad: 0, height: 0, width: frame.width)
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
