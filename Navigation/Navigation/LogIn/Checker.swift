//
//  Checker.swift
//  Navigation
//
//  Created by Максим Жуин on 27.10.2023.
//

import UIKit
import FirebaseAuth

protocol CheckerServiceProtocol {
    var user: FireBaseUser? { get set }
    func signUpUser(email: String, password: String, completion: @escaping(Result<FireBaseUser, Error>) -> Void)
}

class Checker: CheckerServiceProtocol {

    var user: FireBaseUser?

    static let shared = Checker()
    
    private init() {}

    func signUpUser(email: String, password: String, completion: @escaping (Result<FireBaseUser, Error>) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let error = error {
                completion(.failure(error))
            }
            if let authResult = authResult {
                completion(.success(FireBaseUser(user: authResult.user)))
            }
        }
    }

    func checkCredentials(email: String, password: String, completion: @escaping (Result<FireBaseUser, Error>) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if let error = error {
                completion(.failure(error))
            }
            if let authResult = authResult {
                completion(.success(FireBaseUser(user: authResult.user)))
            }
        }
    }

    func logOutUser() {
        do {
            try  Auth.auth().signOut()
        } catch {
            print(error.localizedDescription)
        }
    }

}
