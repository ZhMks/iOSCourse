//
//  Checker.swift
//  Navigation
//
//  Created by Максим Жуин on 27.10.2023.
//

import UIKit


class Checker {

    var user: User?

    static let shared = Checker()

    private init() {}

    func check(password: String) -> Bool {
        password == user?.login ? true : false
    }
}



