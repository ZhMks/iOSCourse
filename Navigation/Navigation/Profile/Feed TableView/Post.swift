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

    static func makeArray() -> [Post] {
        [
        Post(author: "Wedmak.Official",
             imgae: "Film1",
             description: "Новые кадры со съемок второго сезона сериала \"Ведьмак\" ",
             likes: 121,
             views: 121),
        Post(author: "Netology",
             imgae: "Netology1",
             description: """
             От 'Hello, World' до первого сложного iOS-приложения - всего один курс. Если чувствуете в себе силу для покорения топов AppStore - пора начинать действовать! Профессия «iOS-разработчик» - тот самый путь, по которому стоит пройти до самого
             конца. Вы научитесь создавать приложения на языке Swift с нуля: от начинки до интерфейса. Чтобы закрепить знания на практике, каждый студент подготовит дипломную работу - VK-like приложение с возможностью публиковать фотографии, использовать фильтры, ставить лайки и подписываться на других
             пользователей.
             """,
             likes: 120, views: 120),
        Post(author: "SimpleTextAuthor",
             imgae: "Film2",
             description: "TEKSTTEKSTTEKSTTEKSTTEKSTTEKSTTEKST",
             likes: 222,
             views: 223),
        Post(author: "AUTHOR$",
             imgae: "Film3",
             description: "SIMPLETEXT SIMPLETEXT SIMPLETEXT SIMPLETEXT SIMPLETEXT",
             likes: 2222,
             views: 2234)
        ]
    }
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


