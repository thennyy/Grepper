//
//  SplitView.swift
//  GreatTipper
//
//  Created by Thenny Chhorn on 1/27/22.
//

import UIKit

class SplitView: UIView {

    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .thin)
        label.textColor = .gray
        label.textAlignment = .center 
        return label
    }()
    let totalLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 27, weight: .regular)
        label.textColor = .black
        label.text = "0.00"
        label.textAlignment = .center 
        return label
    }()
    
    private let iconLabel = UILabel(titleString: "$", size: 24, fontStyle: .regular)
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        configureUI()
        
    }
    func configureUI() {
        
        iconLabel.textColor = .black
        
        backgroundColor = .defaultGray
        layer.cornerRadius = 18
        layer.shadowOpacity = 0.3
        layer.shadowRadius = 6
        
        addSubview(titleLabel)
        titleLabel.anchor(top: topAnchor, left: leftAnchor, right: rightAnchor, paddingTop: 6, height: 30)

        addSubview(totalLabel)
        totalLabel.anchor(top: titleLabel.bottomAnchor, left: leftAnchor, right: rightAnchor,paddingTop: 9, height: 30)

    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
