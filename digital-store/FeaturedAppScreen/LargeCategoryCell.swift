//
//  LargeCategoryCell.swift
//  digital-store
//
//  Created by ADELU ABIDEEN ADELEYE on 10/11/18.
//  Copyright © 2018 Spantom Technologies Ltd. All rights reserved.
//

import UIKit

class LargeCategoryCell: CategoryCell {
    
    private let largeAppCellId = "largeAppCellId"
    
    override func setupViews() {
        super.setupViews()
        appsCollectionView.register(LargeAppCell.self, forCellWithReuseIdentifier: largeAppCellId)
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 200, height: frame.height - 40)
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: largeAppCellId, for: indexPath) as! LargeAppCell
        
        cell.app = appCategory?.apps?[indexPath.item]
        return cell
    }
    
    private class LargeAppCell: AppCell {
        override func setupViews() {
            addSubview(imageView)
            imageView.setAnchor(top: topAnchor, topPad: 2, bottom: bottomAnchor, bottomPad: 10, left: leftAnchor, leftPad: 0, right: rightAnchor, rightPad: 0, height: 0, width: 0)
        }
    }
    
}
