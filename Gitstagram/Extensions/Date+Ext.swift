//
//  Date+Ext.swift
//  Gitstagram
//
//  Created by Eli Hartnett on 8/6/22.
//

import Foundation

extension Date {
    
    func convertToMonthYearFormat() -> String {
        return formatted(.dateTime.month().year())
    }
}
