//
//  CircleUIButton.swift
//  fitwin
//
//  Created by Baran on 8.08.2017.
//  Copyright © 2017 Brainilission. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable class CircleUIButton: UIButton {
    
    var isInterfaceBuilder: Bool = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        // Initialization code
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    
    @IBInspectable var circularButton: Bool = true{
        didSet {
            self.isInterfaceBuilder = true
            layer.cornerRadius = self.frame.height / 2
            layer.masksToBounds = self.frame.height / 2 > 0
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
            clipsToBounds = true
        }
    }
    @IBInspectable var borderColor: UIColor? {
        didSet {
            layer.borderColor = borderColor?.cgColor
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if isInterfaceBuilder {
            layer.cornerRadius = self.frame.height / 2
            layer.masksToBounds = self.frame.height / 2 > 0
        }
        else{
        }
        
    }
    
    
}
