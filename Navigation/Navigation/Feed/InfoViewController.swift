//
//  InfoViewController.swift
//  Navigation
//
//  Created by Максим Жуин on 28.08.2023.
//

import UIKit
import SnapKit

class InfoViewController: UIViewController {
    lazy var alertButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("ALERT!", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 15.0
        button.backgroundColor = .black
        button.layer.borderWidth = 0.5
        return button
        
    }()
    
    // MARK: -lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let backgroundColor = UIColor(red: 255/255, green: 204/255, blue: 102/255, alpha: 1)
        view.backgroundColor = backgroundColor
        view.addSubview(alertButton)
        buttonChange()
        alertButton.addTarget(self, action: #selector(animationForButton(_:)), for: .touchUpInside)
        alertButton.addTarget(self, action: #selector(tranferToAlertView(_:)), for: .touchUpInside)
    }
    
    // MARK: -func
    
    func buttonChange() {
        alertButton.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(400)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-300)
            make.leading.equalTo(50)
            make.trailing.equalTo(-50)
        }
    }
    
    @objc func animationForButton(_: UIButton) {
        UIView.animate(withDuration: 0.6) {
            self.alertButton.backgroundColor = .red
            self.alertButton.layer.shadowOffset = CGSize(width: 4, height: 10)
            self.alertButton.layer.shadowColor = .init(gray: 15.0, alpha: 1)
            self.alertButton.layer.shadowOpacity = 1
            self.alertButton.layer.shadowRadius = 5.0
            self.alertButton.transform = CGAffineTransform(scaleX: 1.25, y: 1.25)
            self.alertButton.backgroundColor = .black
            self.alertButton.transform = CGAffineTransform(scaleX: 1, y: 1)
        }
    }
    
    @objc func tranferToAlertView(_: UIButton) {
        let uiAllertViewController = UIAllertViewController()
        present(uiAllertViewController.uiAllert, animated: true)
    }
}
