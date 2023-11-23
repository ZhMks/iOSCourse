//
//  PhotosViewModel.swift
//  Navigation
//
//  Created by Максим Жуин on 20.11.2023.
//

import Foundation


protocol PhotosViewModel {
    var onDetail: Action? {get set}
}


class PhotosVMImp: PhotosViewModel {
    var onDetail: Action?
}
