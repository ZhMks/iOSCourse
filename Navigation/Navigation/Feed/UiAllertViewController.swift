//
//  UiAllertViewController.swift
//  Navigation
//
//  Created by Максим Жуин on 28.08.2023.
//

import UIKit

class UIAllertViewController: UIViewController {
    lazy var uiAllert: UIAlertController = {
        let allert = UIAlertController()
        allert.title = "Last view"
        let firstAction = UIAlertAction(title: "Black Button", style: .destructive, handler: { _ in
            print("Black button tapped")

        })
        let secondAction = UIAlertAction(title: "Red Button", style: .destructive, handler: { _ in
            print("Red button tapped")
        })
        allert.addAction(firstAction)
        allert.addAction(secondAction)
        return allert
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemTeal
    }
}
