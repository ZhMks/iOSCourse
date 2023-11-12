//
//  InfoViewController.swift
//  Navigation
//
//  Created by Максим Жуин on 28.08.2023.
//

import UIKit

class InfoViewController: UIViewController {
    

   private lazy var alertButton = GoToPostButton(title: "Alert",
                                                 backgroundColor: .black,
                                                 frame: CGRect(x: 150, y: 250, width: 80, height: 80)) {
       let uiAllertViewController = UIAllertViewController()
       self.present(uiAllertViewController.uiAllert, animated: true)
   }

    // MARK: -lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let backgroundColor = UIColor(red: 255/255, green: 204/255, blue: 102/255, alpha: 1)
        view.backgroundColor = backgroundColor
        view.addSubview(alertButton)
        alertButton.addTarget(self, action: #selector(animationForButton(_:)), for: .touchUpInside)
    }
    
    // MARK: -func
    
    @objc func animationForButton(_: UIButton) {
        UIView.animate(withDuration: 0.6) {
            self.alertButton.backgroundColor = .red
            self.alertButton.transform = CGAffineTransform(scaleX: 1.25, y: 1.25)
            self.alertButton.backgroundColor = .black
            self.alertButton.transform = CGAffineTransform(scaleX: 1, y: 1)
        }
    }
}
