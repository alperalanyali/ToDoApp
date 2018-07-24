//
//  RoundedButton.swift
//  ToDoApp
//
//  Created by Alper on 24.07.2018.
//  Copyright © 2018 Alper. All rights reserved.
//

import UIKit
@IBDesignable
class RoundedButton: UIButton {

    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = true
        }
    }

}
