//
//  MVVMProtocol.swift
//  Navigation
//
//  Created by Максим Жуин on 15.11.2023.
//

import Foundation


protocol FeedViewModel {
    var state: State { get set }
    var secretWord: String { get set }
    var currentState: ((State) -> Void)? { get set }
    var onDetail: Action? {get set}
    func check(word: String)
}

enum State {
    case initial
    case red
    case green
}
