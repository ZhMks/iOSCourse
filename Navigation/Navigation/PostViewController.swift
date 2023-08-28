//
//  PostViewController.swift
//  Navigation
//
//  Created by Максим Жуин on 27.08.2023.
//

import UIKit


class PostViewController: UIViewController {
    
    private lazy var backButton: UIButton = {
        let backButton = UIButton(type: .system)
        backButton.setTitle("Back to Feed", for: .normal)
        backButton.setTitleColor(.black, for: .normal)
        return backButton
    }()
    
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
        view.backgroundColor = .systemBackground
        view.addSubview(backButton)

        backButtonChange()
        backButton.addTarget(self, action: #selector(backButtonPressed(_:)), for: .touchUpInside)

        // Do any additional setup after loading the view.
    }
    
    func backButtonChange() {
        let safeAreaLayout = view.safeAreaLayoutGuide
        backButton.layer.borderColor = UIColor.black.cgColor
        backButton.layer.borderWidth = 2.0
        
        backButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: safeAreaLayout.topAnchor, constant: 500),
            backButton.leadingAnchor.constraint(equalTo: safeAreaLayout.leadingAnchor, constant: 50),
            backButton.trailingAnchor.constraint(equalTo: safeAreaLayout.trailingAnchor, constant: -50)
        ])
    }
    
    @objc func backButtonPressed(_ sender: UIButton) {
        dismiss(animated: true)
    }

}

