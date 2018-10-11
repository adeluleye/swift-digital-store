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
    private let descriptionCellId = "descriptionCellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.alwaysBounceVertical = true
        collectionView.backgroundColor = .white
        
        collectionView.register(AppDetailHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId)
        
        collectionView.register(ScreenshotsCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.register(AppDetailDescriptionCell.self, forCellWithReuseIdentifier: descriptionCellId)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.item == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: descriptionCellId, for: indexPath) as! AppDetailDescriptionCell
            
            return cell
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ScreenshotsCell
        
        cell.app = app
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
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

class AppDetailDescriptionCell: BaseCell {
    
    let descriptionTextView: UITextView = {
        let textView = UITextView()
        let attributedText = NSMutableAttributedString(string: "Description", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18), .foregroundColor: UIColor.black])
        attributedText.append(NSAttributedString(string: "\n\nDescription text bla bla", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14), .foregroundColor: UIColor.gray]))
        
        textView.attributedText = attributedText
        textView.textAlignment = .left
        textView.isEditable = false
        textView.isScrollEnabled = false
        
        return textView
    }()
    
    override func setupViews() {
        super.setupViews()
        
        addSubview(descriptionTextView)
        
        descriptionTextView.setAnchor(top: topAnchor, topPad: 0, bottom: nil, bottomPad: 0, left: leftAnchor, leftPad: 14, right: rightAnchor, rightPad: 0, height: 0, width: 0)
    }
    
}
