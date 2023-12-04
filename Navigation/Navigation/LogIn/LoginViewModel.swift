//
//  LoginViewModel.swift
//  Navigation
//
//  Created by Максим Жуин on 20.11.2023.
//

import UIKit

protocol LoginViewModel {
    var onDetail: Action? {get set}
    var state: State? {get set}
    var currentState: ((State) -> Void)? {get set}
    func check(pass: String)

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

    func check(pass: String) {
        let user = User(login: "123456",
                        fullName: "Maksim Zhuin",
                        avatarImg: UIImage(named: "copybara")!,
                        status: "Show some status")
        Checker.shared.user = user
        if  Checker.shared.check(password: pass) {
            self.state = .green
        } else {
            self.state = .red
        }
    }
}


