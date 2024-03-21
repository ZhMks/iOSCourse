//
//  FakeChecker.swift
//  Navigation
//
//  Created by Максим Жуин on 21.03.2024.
//

import Foundation


final class FakeChecker: CheckerServiceProtocol {

    var checkResult: Result<FireBaseUser, Error>?

    var user: FireBaseUser?

    func signUpUser(email: String, password: String, completion: @escaping (Result<FireBaseUser, any Error>) -> Void) {
        if let result = checkResult {
            completion(result)
        }
    }
}
