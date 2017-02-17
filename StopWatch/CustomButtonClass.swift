//
//  customButtonClass.swift
//  StopWatch
//
//  Created by Nguyen Le Vu Long on 12/25/16.
//  Copyright © 2016 Nguyen Le Vu Long. All rights reserved.
//

import UIKit

@IBDesignable class CustomButtonClass: UIButton {
    @IBInspectable let buttonSize: CGFloat = 80.0
    
    func commonInit() {
        //translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: buttonSize).isActive = true
        widthAnchor.constraint(equalToConstant: buttonSize).isActive = true
        layer.borderColor = ViewController.color.black.cgColor
        layer.borderWidth = 1.0
        layer.cornerRadius = frame.width / 2
        backgroundColor = UIColor.clear
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    func changeColor(_ color: UIColor) {
        layer.borderColor = color.cgColor
        setTitleColor(color, for: .normal)
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
