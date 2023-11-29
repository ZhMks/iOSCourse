//
//  InfoViewModel.swift
//  Navigation
//
//  Created by Максим Жуин on 20.11.2023.
//

import UIKit


protocol InfoViewModel {
    var onAction: Action? {get set}
}

class InfoVMImp: InfoViewModel {
    var onAction: Action?
}
