//
//  CategoryCell.swift
//  digital-store
//
//  Created by ADELU ABIDEEN ADELEYE on 10/10/18.
//  Copyright © 2018 Spantom Technologies Ltd. All rights reserved.
//

import UIKit

class CategoryCell: BaseCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var featuredAppsController: FeaturedAppsController?
    
    
    var appCategory: AppCategory? {
        didSet {
            
            if let name = appCategory?.name {
                nameLabel.text = name
            }
            
            appsCollectionView.reloadData()
        }
    }
    
    
    private let cellId = "appCellId"
    
    let nameLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.text = "Best New Apps"
        return label
    }()
    
    let appsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 16
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.showsHorizontalScrollIndicator = false
        cv.backgroundColor = .clear
        return cv
    }()
    
    let dividerLineView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = UIColor(white: 0.4, alpha: 0.4)
        return view
    }()
    
    override func setupViews() {
        
        super.setupViews()
        
        appsCollectionView.register(AppCell.self, forCellWithReuseIdentifier: cellId)
        
        backgroundColor = .clear
        addSubview(appsCollectionView)
        addSubview(dividerLineView)
        addSubview(nameLabel)
        
        appsCollectionView.dataSource = self
        appsCollectionView.delegate = self
        
        nameLabel.setAnchor(top: topAnchor, topPad: 5, bottom: nil, bottomPad: 0, left: leftAnchor, leftPad: 14, right: rightAnchor, rightPad: 0, height: 30, width: 0)
        
        appsCollectionView.setAnchor(top: topAnchor, topPad: 40, bottom: bottomAnchor, bottomPad: 0, left: leftAnchor, leftPad: 0, right: rightAnchor, rightPad: 0, height: 0, width: 0)
        
        dividerLineView.setAnchor(top: appsCollectionView.bottomAnchor, topPad: 0, bottom: nil, bottomPad: 0, left: leftAnchor, leftPad: 14, right: rightAnchor, rightPad: 0, height: 0.5, width: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let count = appCategory?.apps?.count else { return 0 }
        
        return count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! AppCell
        
        cell.app = appCategory?.apps?[indexPath.item]
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 100, height: frame.height - 40)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if let app = appCategory?.apps?[indexPath.item] {
            featuredAppsController?.showAppDetailForApp(app: app)
        }
    }
    
}
