//
//  ColorExtension.swift
//  EnterAct-Dating
//
//  Created by Thenny Chhorn on 10/15/21.
//

import UIKit

extension UIColor {
    
    static let accentColor = UIColor.rgb(red: 30, green: 142, blue: 184)
    static let defaultGray = UIColor.rgb(red: 229, green: 231, blue: 233)
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
    static let barDeselectedColor = UIColor(white: 0, alpha: 0.2)
}
