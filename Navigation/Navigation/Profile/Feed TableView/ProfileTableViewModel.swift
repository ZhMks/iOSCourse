//
//  ProfileTableViewModel.swift
//  Navigation
//
//  Created by Максим Жуин on 22.11.2023.
//

import UIKit

class ProfileTableViewModel {

    var user: User 

    init(user: User) {
        self.user = user
    }

    func updateView(_ view: ProfileTableHeaderView) {
        view.profileImage.image = user.avatarImg
        view.nameLabel.text = user.fullName
        view.statusLabelText.text = user.status
    }
}
