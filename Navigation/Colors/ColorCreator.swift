//
//  ColorCreator.swift
//  Navigation
//
//  Created by Максим Жуин on 20.03.2024.
//

import Foundation
import UIKit

final class ColorCreator {
    static var themeColor: UIColor = UIColor.createColor(lightMode: .secondarySystemBackground,

                                                         darkMode: UIColor(red: 56/255,
                                                                           green: 51/255,
                                                                           blue: 50/255,
                                                                           alpha: 0.7))

    static var textColor: UIColor = UIColor.createColor(lightMode: UIColor.black,
                                                        darkMode: UIColor.white)
}
