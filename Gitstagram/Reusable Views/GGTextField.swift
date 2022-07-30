//
//  GFTextField.swift
//  Gitstagram
//
//  Created by Eli Hartnett on 7/29/22.
//

import UIKit

class GGTextField: UITextField {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        textColor = .label
        tintColor = .label
        placeholder = "Enter a username"
        textAlignment = .center
        font = UIFont.preferredFont(forTextStyle: .title2)
        adjustsFontSizeToFitWidth = true
        minimumFontSize = 12
        returnKeyType = .search
        
        backgroundColor = .tertiarySystemBackground
        layer.borderWidth = 2
        layer.borderColor = UIColor.systemGray4.cgColor
        layer.cornerRadius = 10

        autocorrectionType = .no
        translatesAutoresizingMaskIntoConstraints = false
    }
}
