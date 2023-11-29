//
//  PostViewModel.swift
//  Navigation
//
//  Created by Максим Жуин on 20.11.2023.
//

import Foundation

protocol PostViewModel {
    var showInfoVC: Action? { get set }
}

class PostVMImp: PostViewModel {
    var showInfoVC: Action?
}
