//
//  LoginTest.swift
//  LoginTest
//
//  Created by Максим Жуин on 21.03.2024.
//

import XCTest
@testable import Navigation
@testable import FirebaseAuth

final class LoginTest: XCTestCase {

    var loginVM: LoginViewModel?
    var checker: CheckerServiceProtocol?

    override func setUpWithError() throws {
        checker = FakeChecker()
        loginVM = LoginVMImp(authService: checker!)
        let excpectation = XCTestExpectation(description: "Success check")
    }

    override func tearDownWithError() throws {
        loginVM = nil
        checker = nil
    }

    func testWrongLogin() throws {
        let email = "zz.@mail.ru"
        let password = "2223331"
        loginVM?.checkUser(email: email, password: password, completion: { result in
            switch result {
            case .success(let success):
                print()
            case .failure(let failure):
                print()
            }
        })
    }

    func testRightLogin() throws {

    }

}
