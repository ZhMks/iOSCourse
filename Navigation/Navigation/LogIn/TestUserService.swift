//
//  TestUserService.swift
//  Navigation
//
//  Created by Максим Жуин on 26.10.2023.
//

import UIKit


final class TestUserService: UserService {
    var user: User?

    init(user: User? = nil) {
        self.user = user
    }
}

