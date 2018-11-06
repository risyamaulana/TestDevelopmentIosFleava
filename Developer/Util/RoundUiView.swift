//
//  RoundUiView.swift
//  Developer
//
//  Created by Risya Maulana on 05/11/18.
//  Copyright © 2018 Fleava. All rights reserved.
//

import UIKit


@IBDesignable
class RoundUiView: UIView {

    @IBInspectable var borderColor: UIColor = UIColor.white {
        didSet {
            self.layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 2.0 {
        didSet {
            self.layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 0.0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
}
