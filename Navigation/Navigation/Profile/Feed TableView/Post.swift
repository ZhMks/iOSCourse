//
//  DataForCell.swift
//  Navigation
//
//  Created by Максим Жуин on 12.09.2023.
//

import Foundation
import UIKit


struct Post {
    var author: String
    var imgae: String
    var description: String
    var likes: Int
    var views: Int
}

struct Photos {

    var photoView: UIImage

   static func makeArray() -> [Photos] {
        [
            Photos(photoView: .init(named: "Netology1")!),
            Photos(photoView: .init(named: "Film1")!),
            Photos(photoView: .init(named: "Film2")!),
            Photos(photoView: .init(named: "Film3")!),
            Photos(photoView: .init(named: "Netology1")!),
            Photos(photoView: .init(named: "Netology1")!),
            Photos(photoView: .init(named: "Netology1")!),
            Photos(photoView: .init(named: "Netology1")!),
            Photos(photoView: .init(named: "Netology1")!),
            Photos(photoView: .init(named: "Netology1")!),
            Photos(photoView: .init(named: "Netology1")!),
            Photos(photoView: .init(named: "Netology1")!),
            Photos(photoView: .init(named: "Netology1")!)
        ]
    }
}


