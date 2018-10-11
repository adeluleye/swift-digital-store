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
            
            if app?.screenshots != nil {
                return
            }
            
            if let id = app?.id {
                let urlString = "https://api.letsbuildthatapp.com/appstore/appdetail?id=\(id)"
                
                URLSession.shared.dataTask(with: URL(string: urlString)!) { (data, response, error) in
                    
                    if error != nil {
                        print(error ?? "Error occured!")
                        return
                    }
                    
                    do {
                        let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! [String: AnyObject]
                        
                        let appDetail = App()
                        
                        appDetail.setValuesForKeys(json)
                        
                        self.app = appDetail
                        
                        
                        DispatchQueue.main.async( execute: { () -> Void in
                            self.collectionView.reloadData()
                        })
                        
                        
                    } catch let err {
                        print(err)
                    }
                    
                }.resume()
            }
            
        }
    }
    
    private let headerId = "headerId"
    private let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.alwaysBounceVertical = true
        collectionView.backgroundColor = .white
        
        collectionView.register(AppDetailHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId)
        
        collectionView.register(ScreenshotsCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ScreenshotsCell
        
        cell.app = app
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath) as! AppDetailHeader
        
        header.app = app
        
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: view.frame.width, height: 170)
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
            
            if let price = app?.price?.stringValue {
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
