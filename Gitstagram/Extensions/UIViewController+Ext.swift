//
//  UIViewController+Ext.swift
//  Gitstagram
//
//  Created by Eli Hartnett on 7/30/22.
//

import UIKit
import SafariServices

extension UIViewController {
    
    func presentGGAlert(alertTitle: String, message: String, buttonTitle: String) {
        let alertVC = GGAlertVC(alertTitle: alertTitle, message: message, buttonTitle: buttonTitle)
        alertVC.modalPresentationStyle = .overFullScreen
        alertVC.modalTransitionStyle = .crossDissolve
        self.present(alertVC, animated: true)
    }
    
    func presentDefaultError() {
        let alertVC = GGAlertVC(alertTitle: "Something went wrong", message: "Unable to complete task at this time. Please try again.", buttonTitle: "Ok")
        alertVC.modalPresentationStyle = .overFullScreen
        alertVC.modalTransitionStyle = .crossDissolve
        self.present(alertVC, animated: true)
    }
    
    func presentSafariVC(with url: URL) {
        let safariVC = SFSafariViewController(url: url)
        safariVC.preferredControlTintColor = .systemPink
        present(safariVC, animated: true)
    }
}
