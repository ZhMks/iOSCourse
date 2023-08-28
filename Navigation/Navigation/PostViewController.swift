//
//  PostViewController.swift
//  Navigation
//
//  Created by Максим Жуин on 27.08.2023.
//

import UIKit


class PostViewController: UIViewController {
  
    lazy var infoSymbol: UIImage = {
        let configuration = UIImage.SymbolConfiguration(font: UIFont.systemFont(ofSize: 12), scale: .large)
        let image = UIImage(systemName: "circle.square.fill", withConfiguration: configuration)
        if let image {
            self.infoSymbol = image
        }
        return infoSymbol
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let backgroundColor = UIColor(red: 255/255, green: 123/255, blue: 255/255, alpha: 1)
        view.backgroundColor = backgroundColor
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Информация", style: .plain, target: self, action: #selector(barButtonPressed(_:)))
    }

    @objc func barButtonPressed(_ sender: UIBarButtonItem) {
        let infoViewController = InfoViewController()
        present(infoViewController, animated: true)
    }
    
}

