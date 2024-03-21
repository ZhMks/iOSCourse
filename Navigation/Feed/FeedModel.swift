//
//  FeedModel.swift
//  Navigation
//
//  Created by Максим Жуин on 12.11.2023.
//

import Foundation


final class FeedModel: FeedViewModel  {

    var onDetail: Action?
    var onInfoScreen: Action?
    
    var currentState: ((State) -> Void)?

    var state: State {
        didSet {
            currentState?(state)
        }
    }

    var secretWord = "Password"

    init(state: State) {
        self.state = state
    }

    func check(word: String){
        guard word == secretWord else {
            self.state = .red
            return
        }
            self.state = .green
        }
    }

