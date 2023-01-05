//
//  HomeController.swift
//  GreatTipper
//
//  Created by Thenny Chhorn on 1/25/22.
//

import UIKit

class HomeConntroller: UIViewController {
   
    // MARK: - Properties
    
    var totalResult = 0
    var totalCountToSplitWith = 1
    
    private let totalSplitLabel = UILabel(titleString: "1", size: 24, fontStyle: .medium)
    private let totalBillLabel = UILabel(titleString: "Bill Total", size: 21, fontStyle: .thin)
    private let tipLabel = UILabel(titleString: "Tip", size: 21, fontStyle: .regular)
    private let totalLabel = UILabel(titleString: "Total", size: 24, fontStyle: .medium)
    private let tipRateLabel = UILabel(titleString: "0%", size: 24, fontStyle: .regular)
    private let totalBillTextField = UITextField(placeholderString: "0", size: 45)
    private let tipTextField = UITextField(placeholderString: "$0.00", size: 24)
   // private let totalTextField = UITextField(placeholderString: "0", size: 45)
    private let chooseTipRateLabel = UILabel(titleString: "Choose Tip %", size: 21, fontStyle: .thin)
    private let dollarSignLabel = UILabel(titleString: "$", size: 45, fontStyle: .thin)
    private let chooseSplitLabel = UILabel(titleString: "Choose Split", size: 21, fontStyle: .thin)
    
    
    private var splitTipView = SplitView()
    private var splitTotalView = SplitView()
    
    private lazy var splitSlider: UISlider = {
        let slider = UISlider()
        slider.maximumValue = 50
        slider.minimumValue = 1

        slider.addTarget(self, action: #selector(handleSplitSlider(_:)), for: .valueChanged)
        return slider
        
    }()

    private lazy var clearButton : UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "delete"), for: .normal)
        button.tintColor = .black
        button.isEnabled = false
        button.backgroundColor = .white
        button.addTarget(self, action: #selector(handleCancelButton), for: .touchUpInside)
        return button
    }()
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 42, weight: .thin)
        label.textAlignment = .center
        label.text = "Grepper"
        return label
    }()

    private lazy var totalStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [dollarSignLabel, totalBillTextField])
        stackView.spacing = 9
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fill
        stackView.axis = .horizontal
        return stackView
    }()

    private lazy var tipSlider: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 50
        slider.value = 15

        slider.addTarget(self, action: #selector(handleTipSlider(_:)), for: .valueChanged)
        return slider
    }()
    private let backGroundTitleImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "background")
        return iv
    }()
    
    private let tipHolderView = HolderView(titleString: "Tip")
    private let totalHolderView = HolderView(titleString: "Total")
    
    private lazy var tipHolderStackView = UIStackView(arrangedSubviews: [tipHolderView,  totalHolderView])
    
    private let adBanner = UIView()
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureTextFields()
        totalBillTextField.delegate = self
        configureDisplayUI()
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        totalBillTextField.resignFirstResponder()
    }
    // MARK: - Helpers
    func configureTextFields() {
        
        totalBillTextField.keyboardType = .decimalPad
        tipTextField.isEnabled = false
        totalBillTextField.backgroundColor = UIColor(white: 1, alpha: 0.3)
        tipRateLabel.textAlignment = .center
        tipRateLabel.textColor = .black
        totalSplitLabel.textAlignment = .center
        totalSplitLabel.textColor = .black
        let value = Int(tipSlider.value)
        tipRateLabel.text = "\(value)%"
        
        splitTipView.titleLabel.text = "After Split Tip"
        splitTotalView.titleLabel.text = "After Split Total"
        
        
    }
    func configureDisplayUI() {
        
        view.backgroundColor = UIColor.defaultGray
        view.addSubview(backGroundTitleImageView)
        backGroundTitleImageView.anchor(top: view.topAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: -45, height: 270)
        backGroundTitleImageView.layer.cornerRadius = 45
        
        backGroundTitleImageView.clipsToBounds = true
        view.addSubview(titleLabel)
        titleLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, right: view.rightAnchor)
        
        view.addSubview(totalBillLabel)
        totalBillLabel.anchor(top: titleLabel.bottomAnchor,height: 45)
        totalBillLabel.centerXAnchor.constraint(equalTo: titleLabel.centerXAnchor).isActive = true
        totalBillLabel.textColor = .darkGray
        dollarSignLabel.setDemensions(height: 60, width: 45)
        dollarSignLabel.textColor = .black
       
        view.addSubview(totalStackView)
        totalStackView.anchor(top: totalBillLabel.bottomAnchor,
                            left: backGroundTitleImageView.leftAnchor,
                            right: backGroundTitleImageView.rightAnchor,
                            paddingTop: 9,
                            paddingLeft: 15,
                            paddingRight: 72)
        
        view.addSubview(clearButton)

        clearButton.setDemensions(height: 30, width: 30)
        clearButton.layer.cornerRadius = 30/2
        clearButton.clipsToBounds = true
        clearButton.centerYAnchor.constraint(equalTo: dollarSignLabel.centerYAnchor).isActive = true
        clearButton.anchor(right: backGroundTitleImageView.rightAnchor, paddingRight: 24)
     
        tipHolderStackView.distribution = .fillEqually
        tipHolderStackView.axis = .horizontal
        tipHolderStackView.spacing = 15
        
        view.addSubview(tipHolderStackView)
        tipHolderStackView.anchor(top: backGroundTitleImageView.bottomAnchor,
                                  left: view.leftAnchor,
                                  right: view.rightAnchor,
                                  paddingTop: 30,
                                  paddingLeft: 15,
                                  paddingRight: 15,
                                  height: 90)
        
        view.addSubview(chooseTipRateLabel)
        chooseTipRateLabel.anchor(top: tipHolderStackView.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 9, paddingLeft: 30, paddingRight: 30, height: 45)
        
        view.addSubview(tipSlider)
        tipSlider.anchor(top: chooseTipRateLabel.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 9, paddingLeft: 30, paddingRight: 90)
        view.addSubview(tipRateLabel)
        tipRateLabel.anchor(right: view.rightAnchor,width: 90, height: 45)
        tipRateLabel.centerYAnchor.constraint(equalTo: tipSlider.centerYAnchor).isActive = true
        
        adBanner.backgroundColor = .white
        
//        view.addSubview(adBanner)
//        adBanner.anchor(top: tipSlider.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor,paddingTop: 30, height: 60)
        
        view.addSubview(chooseSplitLabel)
        chooseSplitLabel.anchor(top: tipSlider.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 9, paddingLeft: 30, paddingRight: 30, height: 45)
        
        view.addSubview(splitSlider)
        splitSlider.anchor(top: chooseSplitLabel.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 9, paddingLeft: 30, paddingRight: 90)
        
        view.addSubview(totalSplitLabel)
        totalSplitLabel.anchor(right: view.rightAnchor, width: 90, height: 45)
        totalSplitLabel.centerYAnchor.constraint(equalTo: splitSlider.centerYAnchor).isActive = true
        
        let stackView = UIStackView(arrangedSubviews: [splitTipView, splitTotalView])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 15
        stackView.distribution = .fillEqually
        
        view.addSubview(stackView)
        stackView.anchor(top: totalSplitLabel.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 30, paddingLeft: 15, paddingRight: 15, height: 90)
        
        
    }
   
    func configureTip() {
   
            let total = totalBillTextField.text!
            
        if total != "" {
            
            guard let billTotal = Double(total) else {return}
            let convertedTip = Int(tipSlider.value)
            print("DEBUG:  convert tip \(convertedTip)")
            let tipPercent = Double(convertedTip) / 100
            let tip = billTotal * tipPercent
            print("DEBUG:  tip is \(tip)")
            tipHolderView.totalLabel.text =  String(format: "%.2f", tip)
            
            let totalBill = tip + billTotal
            totalHolderView.totalLabel.text = String(format: "%.2f", totalBill)
            totalResult = Int(totalBill)
            
   
            print("DEBUG: SPLIT VALUE \(Int(splitSlider.value))")
            
           
            
            let splitCount = Int(splitSlider.value)
            let afterTip = tip / Double(splitCount)
            splitTipView.totalLabel.text = String(format: "%.2f", afterTip)
            print("DEBUG: after split TIP \(afterTip)")
           
            
            let split = billTotal / Double(splitCount)
            
            let totalSplit = split + afterTip
            
            print("DEBUG: TOTALSPLIT \(totalSplit) \(split) \(afterTip)")
            
            splitTotalView.totalLabel.text = String(format: "%.2f", totalSplit)
            
        
        }
    }
    func clearData(){
        
        totalBillTextField.text = ""
        splitTipView.totalLabel.text = "0.00"
        splitTotalView.totalLabel.text = "0.00"
        
        tipHolderView.totalLabel.text = "0.00"
        totalHolderView.totalLabel.text = "0.00"
    }
    // MARK: - Actions
    
    @objc func handleTipSlider(_ sender: UISlider) {
        let value = Int(sender.value)
        tipRateLabel.text = "\(value)%"
        
        configureTip()
        totalBillTextField.resignFirstResponder()
    }
    @objc func handleSplitSlider(_ sender: UISlider){
        
        totalCountToSplitWith = Int(sender.value)
        let value = Int(sender.value)
        totalSplitLabel.text = "\(value)"
        configureTip()
        totalBillTextField.resignFirstResponder()
    }
    @objc func handleCancelButton() {
        
        configureTip()
        clearData()
   
    }
    
}
extension HomeConntroller: UITextFieldDelegate {
    

    func textFieldDidChangeSelection(_ textField: UITextField) {
        
        if textField.text == "" {
            clearData()
        }else {
            configureTip()
        
            clearButton.isEnabled = true
        }
    }
}
