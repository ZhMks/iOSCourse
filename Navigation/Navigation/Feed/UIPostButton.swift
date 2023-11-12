//
//  UIButton.swift
//  Navigation
//
//  Created by Максим Жуин on 06.09.2023.
//

import UIKit

class GoToPostButton: UIButton {

    var buttonTappedClosure: (() -> Void)?

    init(title: String, backgroundColor: UIColor, frame: CGRect?, buttonTappedClosure: (() -> Void)?) {
            super.init(frame: frame ?? .zero)
            self.setTitle(title, for: .normal)
            self.backgroundColor = backgroundColor
            self.buttonTappedClosure = buttonTappedClosure
            customizeButton()
            addTarget(self, action: #selector(animation(_:)), for: .touchUpInside)
            addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func customizeButton() {
        self.setTitleColor(.white, for: .normal)
        self.layer.cornerRadius = 10.0
    }

    @objc private func animation(_ sender: UIButton) {
        UIView.animate(withDuration: 0.5, animations: {
            self.backgroundColor = .cyan
            self.transform = CGAffineTransform(scaleX: 1.25, y: 1.25)
            self.backgroundColor = .blue
            self.transform = CGAffineTransform(scaleX: 1, y: 1)
        })
    }

    @objc private func buttonTapped(_ sender: UIButton) {
        buttonTappedClosure?()
    }
}

