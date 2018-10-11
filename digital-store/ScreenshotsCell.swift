//
//  ScreenshotsCell.swift
//  digital-store
//
//  Created by ADELU ABIDEEN ADELEYE on 10/11/18.
//  Copyright © 2018 Spantom Technologies Ltd. All rights reserved.
//

import UIKit

class ScreenshotsCell: BaseCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    private let cellId = "cellId"
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 16
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .red
        return cv
    }()
    
    override func setupViews() {
        super.setupViews()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.register(ScreenshotImageCell.self, forCellWithReuseIdentifier: cellId)
        
        addSubview(collectionView)
        
        collectionView.setAnchor(top: topAnchor, topPad: 0, bottom: bottomAnchor, bottomPad: 0, left: leftAnchor, leftPad: 0, right: rightAnchor, rightPad: 0, height: 0, width: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ScreenshotImageCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: (frame.width / 2) + 50, height: frame.height - 28)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
    }
}

class ScreenshotImageCell: BaseCell {
    
    override func setupViews() {
        super.setupViews()
        
        backgroundColor = .yellow
    }
    
}
