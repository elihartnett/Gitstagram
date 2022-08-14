//
//  UITableView+Ext.swift
//  Gitstagram
//
//  Created by Eli Hartnett on 8/14/22.
//

import UIKit

extension UITableView {
    func removeExcessCells() {
        tableFooterView = UIView(frame: .zero)
    }
}
