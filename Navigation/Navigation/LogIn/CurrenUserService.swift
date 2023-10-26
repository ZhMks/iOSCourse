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
        if login == user.login {
            return self.user
        } else if login .isEmpty {
            throw PossibleErrors.emptyLogin
        } else {
            throw PossibleErrors.wrongLogin
        }
    }
}

 enum PossibleErrors: Error, CustomStringConvertible {
    case wrongLogin
case emptyLogin

    var description: String {
        switch self {
        case .wrongLogin:
            return "The login is incorrect"
        case .emptyLogin:
            return "The login is empty"
        }
    }
}
