//
//  GGFollowerItemVC.swift
//  Gitstagram
//
//  Created by Eli Hartnett on 8/6/22.
//

import UIKit

protocol GGFollowerItemVCDelegate: AnyObject {
    func didTapGetFollowers(for user: User)
}

class GGFollowerItemVC: GGItemInfoVC {
    
    weak var delegate: GGFollowerItemVCDelegate!
    
    init(user: User, delegate: GGFollowerItemVCDelegate) {
        super.init(user: user)
        self.delegate = delegate
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
    }
    
    private func configureItems() {
        itemInfoView1.set(itemInfoType: .followers, withCount: user.followers)
        itemInfoView2.set(itemInfoType: .following, withCount: user.following)
        actionButton.set(color: .systemPink, title: "Get Followers", systemImageName: "person.3")
    }
    
    override func actionButtonTapped() {
        delegate.didTapGetFollowers(for: user)
    }
}
