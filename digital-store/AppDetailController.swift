//
//  AppDetailController.swift
//  digital-store
//
//  Created by ADELU ABIDEEN ADELEYE on 10/11/18.
//  Copyright © 2018 Spantom Technologies Ltd. All rights reserved.
//

import UIKit

class AppDetailController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var app: App? {
        didSet {
            navigationItem.title = app?.name
        }
    }
    
    private let headerId = "headerId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.alwaysBounceVertical = true
        collectionView.backgroundColor = .white
        
        collectionView.register(AppDetailHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId)
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath) as! AppDetailHeader
        
        header.app = app
        
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        return CGSize(width: view.frame.width, height: 170)
    }
}


class AppDetailHeader: BaseCell {
    
    var app: App? {
        didSet {
            if let imageName = app?.imageName {
                
                imageView.image = UIImage(named: imageName)
            }
            
            nameLabel.text = app?.name
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
    
    override func setupViews() {
        super.setupViews()
        
        addSubview(imageView)
        addSubview(segmentedControl)
        addSubview(nameLabel)
        
        imageView.setAnchor(top: topAnchor, topPad: 14, bottom: nil, bottomPad: 0, left: leftAnchor, leftPad: 14, right: nil, rightPad: 0, height: 100, width: 100)
        
        nameLabel.setAnchor(top: imageView.topAnchor, topPad: 0, bottom: nil, bottomPad: 0, left: imageView.rightAnchor, leftPad: 8, right: nil, rightPad: 0, height: 0, width: 0)
        
        segmentedControl.setAnchor(top: imageView.bottomAnchor, topPad: 8, bottom: nil, bottomPad: 0, left: leftAnchor, leftPad: 40, right: rightAnchor, rightPad: 40, height: 34, width: 0)
    }
    
}

class BaseCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        
    }
    
}
