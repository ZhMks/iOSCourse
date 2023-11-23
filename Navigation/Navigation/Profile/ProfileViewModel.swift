//
//  ProfileViewModel.swift
//  Navigation
//
//  Created by Максим Жуин on 20.11.2023.
//

import UIKit


protocol ProfileViewModel {
    var onDetail: Action? {get set}
}


class ProfileVMImp: ProfileViewModel {
    var onDetail: Action?
}
