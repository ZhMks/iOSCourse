//
//  LoginInspector.swift
//  Navigation
//
//  Created by Максим Жуин on 30.10.2023.
//

import UIKit


struct LoginInspector: LoginViewControllerDelegate {
    func check(login: String, pass: String) -> Bool {
        Checker.shared.check(login: login, pass: pass)
    }
} 


struct MyLoginFactory: LoginFactory {
    func makeLoginInspector() -> LoginInspector {
        return LoginInspector()
    }
}
