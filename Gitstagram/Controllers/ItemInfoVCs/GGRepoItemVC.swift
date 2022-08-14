//
//  GGRepoItemVC.swift
//  Gitstagram
//
//  Created by Eli Hartnett on 8/6/22.
//

import UIKit

protocol GGRepoItemVCDelegate: AnyObject {
    func didTapGitHubProfile(for user: User)
}

class GGRepoItemVC: GGItemInfoVC {
    
    weak var delegate: GGRepoItemVCDelegate!
    
    init(user: User, delegate: GGRepoItemVCDelegate) {
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
        itemInfoView1.set(itemInfoType: .repos, withCount: user.publicRepos)
        itemInfoView2.set(itemInfoType: .gists, withCount: user.publicGists)
        actionButton.set(color: .systemPurple, title: "GitHub Profile", systemImageName: "person")
    }
    
    override func actionButtonTapped() {
        delegate.didTapGitHubProfile(for: user)
    }
}
