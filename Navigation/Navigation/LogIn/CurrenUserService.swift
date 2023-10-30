//
//  CurrenUserService.swift
//  Navigation
//
//  Created by Максим Жуин on 26.10.2023.
//

import UIKit

final class CurrenUserService: UserService {

    var user: User?
    
    init(user: User? = nil) {
        self.user = user
    }

}

 enum PossibleErrors: Error, CustomStringConvertible {
     case wrongLogin
     case emptyLogin

     var description: String {
         switch self {
         case .wrongLogin:
             return "The login is incorrect"
         case .emptyLogin:
             return "The login is empty"
         }
     }
}
