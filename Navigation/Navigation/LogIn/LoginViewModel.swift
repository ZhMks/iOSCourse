//
//  LoginViewModel.swift
//  Navigation
//
//  Created by Максим Жуин on 20.11.2023.
//

import UIKit

protocol LoginViewModel {
    var onDetail: Action? {get set}
    var onSignUP: Action? {get set}
    func checkUser(email: String, password: String, completion: @escaping(Result<FireBaseUser, Error>) -> Void)
    func signUpUser(email: String, password: String, completion: @escaping(Result<FireBaseUser, Error>) -> Void)
}

class LoginVMImp: LoginViewModel {

    var authService: Checker

    var onDetail: Action?
    var onSignUP: Action?
    init(authService: Checker) {
        self.authService = authService
    }

    func checkUser(email: String, password: String, completion: @escaping (Result<FireBaseUser, Error>) -> Void) {
        Checker.shared.checkCredentials(email: email, password: password) { [weak self] result in
            guard self != nil else { return }
            switch result {
            case .success(let user):
                completion(.success(user))
                UserDefaults.standard.set("success", forKey: "User")
            case .failure(let failure):
                completion(.failure(failure))
            }
        }
    }

    func signUpUser(email: String, password: String, completion: @escaping (Result<FireBaseUser, Error>) -> Void) {
        Checker.shared.signUpUser(email: email, password: password) { [weak self] result in
            guard self != nil else { return }
            switch result {
            case .success(let success):
                completion(.success(success))
            case .failure(let failure):
                completion(.failure(failure))
            }
        }
    }

}

