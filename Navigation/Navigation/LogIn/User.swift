//
//  User.swift
//  StorageService
//
//  Created by Максим Жуин on 26.10.2023.
//

import UIKit

final class User {

    var login: String
    var fullName: String
    var avatarImg: UIImage
    var status: String

    init(login: String, fullName: String, avatarImg: UIImage, status: String) {
        self.login = login
        self.fullName = fullName
        self.avatarImg = avatarImg
        self.status = status
    }
}

