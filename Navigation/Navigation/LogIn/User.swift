//
//  User.swift
//  StorageService
//
//  Created by Максим Жуин on 26.10.2023.
//

import UIKit

final class User {

    let login: String
    let fullName: String
    let avatarImg: UIImage
    let status: String

    init(login: String, fullName: String, avatarImg: UIImage, status: String) {
        self.login = login
        self.fullName = fullName
        self.avatarImg = avatarImg
        self.status = status
    }
}

protocol UserService {

    func checkAuthorisationFor(login: String) throws -> User?
}
