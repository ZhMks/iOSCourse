//
//  UiAllertViewController.swift
//  Navigation
//
//  Created by Максим Жуин on 28.08.2023.
//

import UIKit

class UIAllertViewController: UIViewController {
    lazy var uiAllert: UIAlertController = {
        let allert = UIAlertController(title: "Last View", message: "Message", preferredStyle: .alert)
        let firstAction = UIAlertAction(title: "Black Button", style: .default, handler: {_ in
            print("Black button tapped")
        })
        let secondAction = UIAlertAction(title: "Red Button", style: .default, handler: { _ in
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
