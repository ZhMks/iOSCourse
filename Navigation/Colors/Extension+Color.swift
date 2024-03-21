//
//  Extension+Color.swift
//  Navigation
//
//  Created by Максим Жуин on 20.03.2024.
//

import Foundation
import UIKit


extension UIColor {
    static func createColor(lightMode: UIColor, darkMode: UIColor) -> UIColor {
        guard #available(iOS 13.0, *) else {
            return lightMode
        }
        return UIColor { (traitCollection) -> UIColor in
            return traitCollection.userInterfaceStyle == .light ? lightMode :
            darkMode
        }
    }
}
