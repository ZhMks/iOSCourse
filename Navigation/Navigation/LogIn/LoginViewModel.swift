//
//  LoginViewModel.swift
//  Navigation
//
//  Created by Максим Жуин on 20.11.2023.
//

import Foundation

protocol LoginViewModel: LoginViewControllerDelegate {
    var onDetail: Action? {get set}
    var state: State? {get set}
    var currentState: ((State) -> Void)? {get set}
}


class LoginVMImp: LoginViewModel {
    
    var onDetail: Action?
    var currentState: ((State) -> Void)?

    var state: State? {
        didSet {
            currentState?(state!)
        }
    }

    init(state: State) {
        self.state = state
    }

    func check(login: String, pass: String) -> Bool {
        if Checker.shared.check(login: login, pass: pass) {
            self.state = .green
            return true
        } else {
            self.state = .red
            return false
        }
    }
}

