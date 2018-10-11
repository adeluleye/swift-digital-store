//
//  Header.swift
//  digital-store
//
//  Created by ADELU ABIDEEN ADELEYE on 10/11/18.
//  Copyright © 2018 Spantom Technologies Ltd. All rights reserved.
//

import UIKit

class Header: CategoryCell {
    
    let bannerCellId = "bannerCellId"
    
    override func setupViews() {
        // super.setupViews()
        
        appsCollectionView.delegate = self
        appsCollectionView.dataSource = self
        
        addSubview(appsCollectionView)
        appsCollectionView.setAnchor(top: topAnchor, topPad: 0, bottom: bottomAnchor, bottomPad: 0, left: leftAnchor, leftPad: 0, right: rightAnchor, rightPad: 0, height: 0, width: 0)
        appsCollectionView.register(BannerCell.self, forCellWithReuseIdentifier: bannerCellId)
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: (frame.width / 2) + 50, height: frame.height)
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: bannerCellId, for: indexPath) as! BannerCell
        
        cell.app = appCategory?.apps?[indexPath.item]
        return cell
    }
    
    private class BannerCell: AppCell {
        override func setupViews() {
            addSubview(imageView)
            imageView.layer.borderColor = UIColor(white: 0.5, alpha: 0.5).cgColor
            imageView.layer.borderWidth = 0.5
            imageView.layer.cornerRadius = 0
            imageView.setAnchor(top: topAnchor, topPad: 0, bottom: bottomAnchor, bottomPad: 0, left: leftAnchor, leftPad: 0, right: rightAnchor, rightPad: 0, height: 0, width: 0)
        }
    }
    
}
