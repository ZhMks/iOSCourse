//
//  InfoViewController.swift
//  Navigation
//
//  Created by Максим Жуин on 28.08.2023.
//

import UIKit

class InfoViewController: UIViewController {

    let infoVM: InfoViewModel

    private lazy var alertButton: UIButton = {
        let alertButton = UIButton(type: .system)
        alertButton.backgroundColor = .black
        alertButton.translatesAutoresizingMaskIntoConstraints = false
        alertButton.setTitle("Present Alert", for: .normal)
        alertButton.addTarget(self, action: #selector(tapOnAlertButton(_:)), for: .touchUpInside)
        return alertButton
    }()

    // MARK: -lifecycle

    init(infoVM: InfoViewModel) {
        self.infoVM = infoVM
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let backgroundColor = UIColor(red: 255/255, green: 204/255, blue: 102/255, alpha: 1)
        view.backgroundColor = backgroundColor
        alertButton.addTarget(self, action: #selector(animationForButton(_:)), for: .touchUpInside)
    }
    
    // MARK: -func

    func setupUI() {
        let safeArea = view.safeAreaLayoutGuide
        view.addSubview(alertButton)
        NSLayoutConstraint.activate([
            alertButton.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            alertButton.centerYAnchor.constraint(equalTo: safeArea.centerYAnchor)]
        )
    }

    @objc func animationForButton(_: UIButton) {
        UIView.animate(withDuration: 0.6) {
            self.alertButton.backgroundColor = .red
            self.alertButton.transform = CGAffineTransform(scaleX: 1.25, y: 1.25)
            self.alertButton.backgroundColor = .black
            self.alertButton.transform = CGAffineTransform(scaleX: 1, y: 1)
        }
    }

    @objc func tapOnAlertButton(_ sender: UIButton) {
           let uiAllertViewController = UIAllertViewController()
           self.present(uiAllertViewController.uiAllert, animated: true)
    }
}
