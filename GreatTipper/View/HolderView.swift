//
//  HolderView.swift
//  GreatTipper
//
//  Created by Thenny Chhorn on 2/10/22.
//

import UIKit


class HolderView: UIView {
    
    var titleLabel: UILabel = {
        
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 21, weight: .thin)
        label.textColor = .gray
        label.textAlignment  = .center
        
        return label
    }()
    var totalLabel:  UILabel = {
        
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 27, weight: .regular)
        label.textColor = .black
        label.textAlignment  = .center
        label.text = "0.00"
        return label
    }()
    
    init(titleString: String) {
        super.init(frame: .zero)
        
        titleLabel.text = titleString
        configureUI()
    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configureUI() {
        
        backgroundColor = .defaultGray
        layer.cornerRadius = 18
        layer.shadowOpacity = 0.3
        layer.shadowRadius = 6
        
        addSubview(titleLabel)
        titleLabel.anchor(top: topAnchor,
                          left: leftAnchor,
                          right: rightAnchor,
                          paddingTop: 9,
                          height: 30)
        
        addSubview(totalLabel)
        totalLabel.anchor(top: titleLabel.bottomAnchor,
                          left: leftAnchor,
                          right: rightAnchor,
                          paddingTop: 9,
                          height: 30)
    }
}
