//
//  AppDetailHeader.swift
//  digital-store
//
//  Created by ADELU ABIDEEN ADELEYE on 10/11/18.
//  Copyright © 2018 Spantom Technologies Ltd. All rights reserved.
//

import UIKit

class AppDetailHeader: BaseCell {
    
    var app: App? {
        didSet {
            if let imageName = app?.ImageName {
                
                imageView.image = UIImage(named: imageName)
            }
            
            nameLabel.text = app?.Name
            
            if let price = app?.Price {
                buyButton.setTitle("$\(price)", for: .normal)
            }
        }
    }
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 16
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let segmentedControl: UISegmentedControl = {
        let sc = UISegmentedControl(items: ["Details", "Reviews", "Related"])
        sc.tintColor = .darkGray
        sc.selectedSegmentIndex = 0
        return sc
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.systemFont(ofSize: 16)
        label.text = "TEST"
        return label
    }()
    
    let buyButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("BUY", for: .normal)
        button.layer.borderColor = UIColor.buyButtonBorderColor.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        return button
    }()
    
    let dividerLineView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = UIColor(white: 0.4, alpha: 0.4)
        return view
    }()
    
    
    
    override func setupViews() {
        super.setupViews()
        
        addSubview(imageView)
        addSubview(segmentedControl)
        addSubview(nameLabel)
        addSubview(buyButton)
        addSubview(dividerLineView)
        
        imageView.setAnchor(top: topAnchor, topPad: 14, bottom: nil, bottomPad: 0, left: leftAnchor, leftPad: 14, right: nil, rightPad: 0, height: 100, width: 100)
        
        nameLabel.setAnchor(top: imageView.topAnchor, topPad: 0, bottom: nil, bottomPad: 0, left: imageView.rightAnchor, leftPad: 8, right: nil, rightPad: 0, height: 0, width: 0)
        
        buyButton.setAnchor(top: nil, topPad: 0, bottom: imageView.bottomAnchor, bottomPad: 0, left: nil, leftPad: 0, right: rightAnchor, rightPad: 14, height: 0, width: 60)
        
        segmentedControl.setAnchor(top: imageView.bottomAnchor, topPad: 14, bottom: nil, bottomPad: 0, left: leftAnchor, leftPad: 40, right: rightAnchor, rightPad: 40, height: 34, width: 0)
        
        dividerLineView.setAnchor(top: nil, topPad: 0, bottom: bottomAnchor, bottomPad: 0, left: leftAnchor, leftPad: 0, right: rightAnchor, rightPad: 0, height: 0.5, width: 0)
    }
    
}
