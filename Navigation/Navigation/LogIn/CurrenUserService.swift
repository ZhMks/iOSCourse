//
//  CurrenUserService.swift
//  Navigation
//
//  Created by Максим Жуин on 26.10.2023.
//

import UIKit

final class CurrenUserService {

    var user: User

    init(user: User) {
        self.user = user
    }
}

extension CurrenUserService: UserService {

    func checkAuthorisationFor(login: String) throws -> User? {
        if login.contains(user.login) {
            return self.user
        } else {
            throw PossibleErrors.wrongLogin
        }
    }
}

 enum PossibleErrors: Error, CustomStringConvertible {
    case wrongLogin


    var description: String {
        switch self {
        case .wrongLogin:
            return "The login is incorrect"
        }
    }
}
