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
    
    var featuredApps: FeaturedApps?
    
    var appCategories: [AppCategory]?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Featured Apps"
        
        AppCategory.fetchFeaturedApps { (featuredApps) in
            
            self.featuredApps = featuredApps
            
            self.appCategories = featuredApps.appCategories
            
            self.collectionView?.reloadData()
        }
        
        collectionView.backgroundColor = .white
        
        collectionView.register(CategoryCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.register(LargeCategoryCell.self, forCellWithReuseIdentifier: largeCellId)
        
        collectionView.register(Header.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId)
        
        collectionView.showsVerticalScrollIndicator = false
    }
    
    func showAppDetailForApp(app: App) {
        let layout = UICollectionViewFlowLayout()
        let appDetailController = AppDetailController(collectionViewLayout: layout)
        navigationController?.pushViewController(appDetailController, animated: true)
        
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        guard let count = appCategories?.count else { return 0 }
        
        return count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.item == 2 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: largeCellId, for: indexPath) as! LargeCategoryCell
            
            cell.appCategory = appCategories?[indexPath.item]
            
            cell.featuredAppsController = self
            
            return cell
            
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! CategoryCell
        cell.appCategory = appCategories?[indexPath.item]
        
        cell.featuredAppsController = self
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if indexPath.item == 2 {
            return CGSize(width: view.frame.width, height: 160)
        }
        
        return CGSize(width: view.frame.width, height: 230)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        return CGSize(width: view.frame.width, height: 120)
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath) as! Header
        
        header.appCategory = featuredApps?.bannerCategory
        
        return header
        
    }

}

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
