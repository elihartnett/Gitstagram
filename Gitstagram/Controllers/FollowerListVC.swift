//
//  FollowerListVCViewController.swift
//  Gitstagram
//
//  Created by Eli Hartnett on 7/30/22.
//

import UIKit

class FollowerListVC: UIViewController {

    var username: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
        NetworkManager.shared.getFollowers(for: username, page: 1) { result in
            switch result {
            case.success(let followers):
                print(followers.count)
                print(followers)
            case .failure(let error):
                self.presentGFAlertOnMainThread(alertTitle: "Bad stuff happened", message: error.rawValue, buttonTitle: "Ok")
                return
            }
        }
    }
}
