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
            Photos(photoView: .init(named: "gldot")!),
            Photos(photoView: .init(named: "Film1")!),
            Photos(photoView: .init(named: "Film2")!),
            Photos(photoView: .init(named: "Film3")!),
            Photos(photoView: .init(named: "forsazh")!),
            Photos(photoView: .init(named: "Ww")!),
            Photos(photoView: .init(named: "ww1984")!),
            Photos(photoView: .init(named: "testImg")!),
            Photos(photoView: .init(named: "flash")!),
            Photos(photoView: .init(named: "batman")!),
            Photos(photoView: .init(named: "foundation")!),
            Photos(photoView: .init(named: "nile")!),
            Photos(photoView: .init(named: "Netology1")!),
            Photos(photoView: .init(named: "Netology1")!),
            Photos(photoView: .init(named: "Netology1")!),
            Photos(photoView: .init(named: "Netology1")!),
            Photos(photoView: .init(named: "Netology1")!),
            Photos(photoView: .init(named: "Netology1")!),
            Photos(photoView: .init(named: "Netology1")!),
            Photos(photoView: .init(named: "Netology1")!),
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


