//
//  GradientLayer.swift
//  PriceCoins
//
//  Created by Thenny Chhorn on 12/21/21.
//

import UIKit

extension UIViewController {
    
    func configureGradientLayer() {
        
        let topColor = UIColor.white
        let bottomColor = UIColor.systemTeal
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [topColor.cgColor, bottomColor.cgColor]
        gradientLayer.locations = [0,1]
        view.layer.addSublayer(gradientLayer)
        gradientLayer.frame = view.frame
        
    }
}
