//
//  LocalAuthorisationService.swift
//  Navigation
//
//  Created by Максим Жуин on 22.03.2024.
//

import Foundation
import LocalAuthentication
import KeychainAccess

enum AuthorisationErrors: Error {
    case cannotAuthorise
}

enum BiometryType {
    case none
    case touch
    case face
}


final class LocalAuthorisationService {

    let context = LAContext()
    let keychain = Keychain()
    var errorPointer = ErrorPointer(nilLiteral: ())

    static var shared = LocalAuthorisationService()

    private init() { }

    func authoriseWithBioMetrics(_ completion: @escaping (Result<Bool, AuthorisationErrors>) -> Void)  {
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: errorPointer) {
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "test") { isAuthorized, error in
                if let error = error {
                    completion(.failure(.cannotAuthorise))
                    print(error.localizedDescription)
                }
                if isAuthorized {
                    completion(.success(true))
                }
            }
        }
    }

    func saveToKeyChain(email: String, password: String) {
        do{
            try keychain.set(password, key: email)
            try keychain.set(email, key: "newUser")
            UserDefaults.standard.set(email, forKey: "newUser")
        } catch {
            print(error.localizedDescription)
        }
    }

    func getDataFromKeyChain() -> (String, String) {
        if let value = UserDefaults.standard.value(forKey: "newUser") as? String {
            do {
                let passToken = try keychain.getString(value)
                let emailToken = try keychain.getString("newUser")
                return (passToken!, emailToken!)
            } catch {
                print(error.localizedDescription)
            }
        }
        return ("", "")
    }

    func biometricType() -> BiometryType {
        let _ = context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil)
        switch context.biometryType {
        case .none:
            return .none
        case .touchID:
            return .touch
        case .faceID:
            return .face
        default: break
        }

        return context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil) ? .touch : .none
    }
}
