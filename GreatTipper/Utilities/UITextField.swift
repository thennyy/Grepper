//
//  UITextField.swift
//  GreatTipper
//
//  Created by Thenny Chhorn on 1/25/22.
//

import UIKit

extension UITextField {
    
    convenience init(placeholderString: String, size: CGFloat) {
        
        self.init()
        
        placeholder = placeholderString
        font = UIFont.systemFont(ofSize: size)
        textColor = .black
       
        backgroundColor = .clear
        layer.borderWidth = 1
        layer.borderColor = UIColor.white.cgColor
        textAlignment = .right
        let space = UIView()
        space.frame = CGRect(x: 0, y: 0, width: 9, height: frame.height)
        layer.cornerRadius = 12
        clipsToBounds = true
        rightViewMode = .always
        rightView = space
        tintColor = .white
    }
    
}
