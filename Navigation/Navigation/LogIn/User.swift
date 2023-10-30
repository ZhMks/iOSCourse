//
//  User.swift
//  StorageService
//
//  Created by Максим Жуин on 26.10.2023.
//

import UIKit

protocol UserService {
    var user: User? { get set }
}

extension UserService {
    func checkAuthorisationFor(login: String) throws -> User? {
        if login == user?.login {
            return user
        } else if login.isEmpty {
            throw PossibleErrors.emptyLogin
        } else {
            throw PossibleErrors.wrongLogin
        }
    }
}

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

