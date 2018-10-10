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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    func setupViews() {
        addSubview(imageView)
        
        imageView.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.width)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
