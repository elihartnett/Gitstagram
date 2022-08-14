//
//  UIView+Ext.swift
//  Gitstagram
//
//  Created by Eli Hartnett on 8/14/22.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        for view in views { addSubview(view) }
    }
}
