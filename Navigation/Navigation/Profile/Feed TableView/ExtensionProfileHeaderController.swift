//
//  ExtensionProfileHeaderController.swift
//  Navigation
//
//  Created by Максим Жуин on 13.09.2023.
//

import Foundation
import UIKit

extension UITableView {
    func setAndLayout(header: UIView) {
        tableHeaderView = header
        header.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            header.widthAnchor.constraint(equalTo: widthAnchor)
        ])
        header.setNeedsLayout()
        header.layoutIfNeeded()
        header.frame.size = header.systemLayoutSizeFitting(UIView.layoutFittingExpandedSize)
    }
}
