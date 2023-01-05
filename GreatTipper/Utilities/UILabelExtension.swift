//
//  LabelExtension.swift
//  GreatTipper
//
//  Created by Thenny Chhorn on 1/25/22.
//

import UIKit

enum FontStyle {
    case thin
    case regular
    case medium
    case bold
}


extension UILabel {
    
    convenience init(titleString: String, size: CGFloat, fontStyle: FontStyle) {
        self.init()
        textColor = .gray
       // font = UIFont.boldSystemFont(ofSize: size)
        textAlignment = .center
        text = titleString
        
        switch fontStyle {
        case .regular:
            font = UIFont.systemFont(ofSize: size)
        case .medium:
            font = UIFont.systemFont(ofSize: size, weight: .medium)
        case .bold:
            font = UIFont.systemFont(ofSize: size, weight: .bold)
        case .thin:
            font = UIFont.systemFont(ofSize: size, weight: .thin)
        }
    }
}
