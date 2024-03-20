//
//  SignUpController.swift
//  Navigation
//
//  Created by Максим Жуин on 06.01.2024.
//

import Foundation
import UIKit


final class SignUpController: UIViewController {
    private lazy var nameTextField: UITextField = {
        let nameTextField = UITextField()
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        nameTextField.borderStyle = .roundedRect
        nameTextField.backgroundColor = .systemGray2
        nameTextField.placeholder = NSLocalizedString("Enter name", tableName: "Localizable", comment: "")
        return nameTextField
    }()

    private lazy var statusTextField: UITextField = {
        let statusTextField = UITextField()
        statusTextField.translatesAutoresizingMaskIntoConstraints = false
        statusTextField.borderStyle = .roundedRect
        statusTextField.backgroundColor = .systemGray2
        statusTextField.placeholder = NSLocalizedString("Enter Status", tableName: "Localizable", comment: "")
        return statusTextField
    }()

    private lazy var signUpButton: UIButton = {
        let signUpButton = UIButton(type: .system)
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        signUpButton.setTitle(NSLocalizedString("Sign Up", tableName: "Localizable", comment: ""), for: .normal)
        signUpButton.backgroundColor = .systemBlue
        signUpButton.addTarget(self, action: #selector(signUpButtonTapped(_:)), for: .touchUpInside)
        return signUpButton
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
        view.backgroundColor = .white
    }

    private func layout() {
        view.addSubview(nameTextField)
        view.addSubview(statusTextField)
        view.addSubview(signUpButton)

        let safeArea = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            nameTextField.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 30.0),
            nameTextField.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 30.0),
            nameTextField.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -30.0),

            statusTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 30.0),
            statusTextField.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 30.0),
            statusTextField.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -30.0),

            signUpButton.topAnchor.constraint(equalTo: statusTextField.bottomAnchor, constant: 30.0),
            signUpButton.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 30.0),
            signUpButton.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -30.0)
        ])
    }

    @objc func signUpButtonTapped(_ sender: UIButton) {
        let firestore = FiresService()
        let event = Event(name: nameTextField.text!, status: statusTextField.text!)
        firestore.addEvent(event: event)
        self.navigationController?.popViewController(animated: true)
    }
}
