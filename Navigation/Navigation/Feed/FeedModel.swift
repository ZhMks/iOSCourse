//
//  FeedModel.swift
//  Navigation
//
//  Created by Максим Жуин on 12.11.2023.
//

import Foundation


final class FeedModel: UsersVMOutput  {
    
    var currentState: ((State) -> Void)?

    var state: State {
        willSet {
            print(newValue)
        }
        didSet {
            currentState?(state)
        }
    }

    var secretWord = "Password"

    init(state: State) {
        self.state = state
    }

    func check(word: String) -> State {
        if word == secretWord {
            self.state = .green
            return state
        } else {
            self.state = .red
            return state
        }
    }
}
