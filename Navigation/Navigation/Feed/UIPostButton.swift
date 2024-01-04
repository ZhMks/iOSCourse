//
//  UIButton.swift
//  Navigation
//
//  Created by Максим Жуин on 06.09.2023.
//

import UIKit


class GoToPostButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        customizeButton()
        self.addTarget(self, action: #selector(animation(_:)), for: .touchUpInside)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension GoToPostButton {
    func customizeButton() {
        self.backgroundColor = .blue
        self.setTitle("Go to Post", for: .normal)
        self.setTitleColor(.white, for: .normal)
        self.layer.cornerRadius = 10.0
        self.layer.shadowOffset = CGSize(width: 0, height: 4)
        self.layer.shadowOpacity = 0.5
        self.layer.shadowRadius = 4
        self.layer.shadowColor = UIColor.black.cgColor
    }

    @objc func animation(_ sender: UIButton) {
        UIView.animate(withDuration: 0.5, animations: {
            self.backgroundColor = .cyan
            self.transform = CGAffineTransform(scaleX: 1.25, y: 1.25)
            self.backgroundColor = .blue
            self.transform = CGAffineTransform(scaleX: 1, y: 1)
        })
    }
}
