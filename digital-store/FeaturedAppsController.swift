//
//  ViewController.swift
//  digital-store
//
//  Created by ADELU ABIDEEN ADELEYE on 10/9/18.
//  Copyright © 2018 Spantom Technologies Ltd. All rights reserved.
//

import UIKit

class FeaturedAppsController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    private let cellId = "categoryCellId"
    private let largeCellId = "largeCellId"
    private let headerId = "headerId"
    
    var appCategories: [AppCategory]?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // appCategories = AppCategory.sampleAppCategories()
        AppCategory.fetchFeaturedApps { (appCategories) in
            
            self.appCategories = appCategories
            
            self.collectionView?.reloadData()
        }
        
        collectionView.backgroundColor = .white
        
        collectionView.register(CategoryCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.register(LargeCategoryCell.self, forCellWithReuseIdentifier: largeCellId)
        
        collectionView.register(Header.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId)
        
        collectionView.showsVerticalScrollIndicator = false
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        guard let count = appCategories?.count else { return 0 }
        
        return count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.item == 2 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: largeCellId, for: indexPath) as! LargeCategoryCell
            
            cell.appCategory = appCategories?[indexPath.item]
            
            return cell
            
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! CategoryCell
        cell.appCategory = appCategories?[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if indexPath.item == 2 {
            return CGSize(width: view.frame.width, height: 160)
        }
        
        return CGSize(width: view.frame.width, height: 230)
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath) as! Header
        return header
        
    }

}

class Header: CategoryCell {
    
}

class LargeCategoryCell: CategoryCell {
    
    private let largeAppCellId = "largeAppCellId"
    
    override func setupViews() {
        super.setupViews()
        appsCollectionView.register(LargeAppCell.self, forCellWithReuseIdentifier: largeAppCellId)
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 200, height: frame.height - 30)
        
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
