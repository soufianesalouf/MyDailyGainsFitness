//
//  InsetTextField.swift
//  breakpoint
//
//  Created by Soufiane Salouf on 3/5/18.
//  Copyright © 2018 Soufiane Salouf. All rights reserved.
//

import UIKit

class InsetTextField: UITextField {

    override func awakeFromNib() {
        super.awakeFromNib()
        let placeholder = NSAttributedString(string: self.placeholder!, attributes: [NSAttributedStringKey.foregroundColor: PLACEHOLDER_COLOR])
        self.attributedPlaceholder = placeholder
    }
    
}
