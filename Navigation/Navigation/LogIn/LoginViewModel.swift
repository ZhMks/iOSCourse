//
//  LoginViewModel.swift
//  Navigation
//
//  Created by Максим Жуин on 20.11.2023.
//

import Foundation

protocol LoginViewModel {
    var onDetail: Action? {get set}
    var state: State? {get set}
    var currentState: ((State) -> Void)? {get set}
    func bruteForce(passwordToUnlock: String)
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
        DispatchQueue.global().async { [weak self] in
            self?.bruteForce(passwordToUnlock: pass)
            self?.state = .green
        }
    }


    func bruteForce(passwordToUnlock: String)  {

        self.state = .red

        let ALLOWED_CHARACTERS:   [String] = String().printable.map { String($0) }

        var password: String = ""

        while password != passwordToUnlock {
            password = Checker.shared.generateBruteForce(password, fromArray: ALLOWED_CHARACTERS)
        }
        print(password)
    }
}


