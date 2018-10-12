//
//  AppDetailDescriptionCell.swift
//  digital-store
//
//  Created by ADELU ABIDEEN ADELEYE on 10/12/18.
//  Copyright © 2018 Spantom Technologies Ltd. All rights reserved.
//

import UIKit

class AppDetailDescriptionCell: BaseCell {
    
    let descriptionTextView: UITextView = {
        let textView = UITextView()
        
        textView.textAlignment = .left
        textView.isEditable = false
        textView.isScrollEnabled = false
        
        return textView
    }()
    
    let dividerLineView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = UIColor(white: 0.4, alpha: 0.4)
        return view
    }()
    
    override func setupViews() {
        super.setupViews()
        
        addSubview(descriptionTextView)
        addSubview(dividerLineView)
        
        descriptionTextView.setAnchor(top: topAnchor, topPad: 0, bottom: nil, bottomPad: 0, left: leftAnchor, leftPad: 8, right: rightAnchor, rightPad: 8, height: 0, width: 0)
        
        dividerLineView.setAnchor(top: nil, topPad: 0, bottom: bottomAnchor, bottomPad: 0, left: leftAnchor, leftPad: 14, right: rightAnchor, rightPad: 0, height: 0.5, width: 0)
    }
    
}
