//
//  Checker.swift
//  Navigation
//
//  Created by Максим Жуин on 27.10.2023.
//

import UIKit

protocol LoginViewControllerDelegate {
    func check(login: String, pass: String) -> Bool
}

class Checker {

    private let login = "Zhmks"
    private let password = "123456"

    static let shared = Checker()

    private init() {}

    func check(login: String, pass: String) -> Bool {
        if login == self.login && pass == self.password {
            return true
        } else {
            return false
        }
    }
}
