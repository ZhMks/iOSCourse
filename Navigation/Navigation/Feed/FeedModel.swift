//
//  FeedModel.swift
//  Navigation
//
//  Created by Максим Жуин on 12.11.2023.
//

import Foundation


final class FeedModel {
    var secretWord = "Password"

    func check(word: String) -> Bool {
        word == secretWord ? true : false
    }
}
