//
//  InfoViewController.swift
//  Navigation
//
//  Created by Максим Жуин on 28.08.2023.
//

import UIKit

class InfoViewController: UIViewController {
    
    lazy var alertButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let backgroundColor = UIColor(red: 255/255, green: 204/255, blue: 102/255, alpha: 1)
        view.backgroundColor = backgroundColor
        view.addSubview(alertButton)
        buttonChange()
        alertButton.addTarget(self, action: #selector(tranferToAlertView(_:)), for: .touchUpInside)
    }
    
    func buttonChange() {
        
        alertButton.translatesAutoresizingMaskIntoConstraints = false
        alertButton.setTitle("ALERT!", for: .normal)
        alertButton.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        alertButton.setTitleColor(.white, for: .normal)
        alertButton.layer.borderColor = UIColor(named: "black")?.cgColor
        alertButton.backgroundColor = .black
        alertButton.layer.borderWidth = 0.5
        
        let safeArealayoutGuide = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            alertButton.topAnchor.constraint(equalTo: safeArealayoutGuide.topAnchor, constant: 400),
            alertButton.bottomAnchor.constraint(equalTo: safeArealayoutGuide.bottomAnchor, constant: -200),
            alertButton.leadingAnchor.constraint(equalTo: safeArealayoutGuide.leadingAnchor, constant: 50),
            alertButton.trailingAnchor.constraint(equalTo: safeArealayoutGuide.trailingAnchor, constant: -50)
        ])
    }
    
    @objc func tranferToAlertView(_ : UIButton) {
        let uiAllertViewController = UIAllertViewController()
        present(uiAllertViewController, animated: true)
    }
}
