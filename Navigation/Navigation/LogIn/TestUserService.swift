//
//  TestUserService.swift
//  Navigation
//
//  Created by Максим Жуин on 26.10.2023.
//

import UIKit


final class TestUserService {

    var user: User

    init(user: User) {
        self.user = user
    }
}

extension TestUserService: UserService {

    func checkAuthorisationFor(login: String) throws -> User? {
        return self.user
    }
}
