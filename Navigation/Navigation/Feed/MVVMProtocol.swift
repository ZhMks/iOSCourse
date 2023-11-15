//
//  MVVMProtocol.swift
//  Navigation
//
//  Created by Максим Жуин on 15.11.2023.
//

import Foundation


protocol UsersVMOutput {
    var state: State { get set }
    var secretWord: String { get set }
    var currentState: ((State) -> Void)? { get set }
    func check(word: String) -> State
}

enum State {
    case initial
    case red
    case green
}
