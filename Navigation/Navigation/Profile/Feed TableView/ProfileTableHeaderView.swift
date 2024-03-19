//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Максим Жуин on 02.09.2023.
//

import UIKit

class ProfileTableHeaderView: UIView {

    // MARK: - Properties

    private var statusText: String?
    private var viewModel: ProfileTableViewModel

    lazy var animatedView: UIView = {
        let animatedView = UIView()
        animatedView.isHidden = true
        return animatedView
    }()

    lazy var nameLabel: UILabel = {
        let name = UILabel()
        name.translatesAutoresizingMaskIntoConstraints = false 
        name.font = UIFont.boldSystemFont(ofSize: 16)
        name.textColor = .black

        return name
    }()

    lazy var profileImage: UIImageView = {
        let profileView = UIImageView()
        profileView.translatesAutoresizingMaskIntoConstraints = false
        profileView.layer.borderColor = UIColor(white: 100, alpha: 1).cgColor
        profileView.layer.borderWidth = 3
        profileView.layer.cornerRadius = 75
        profileView.layer.masksToBounds = true
        profileView.isUserInteractionEnabled = true

        return profileView
    }()

    lazy var statusLabelText: UILabel = {
        let statusLabelText = UILabel()
        statusLabelText.translatesAutoresizingMaskIntoConstraints = false
        statusLabelText.text = ""
        statusLabelText.textColor = .gray
        statusLabelText.font = UIFont.systemFont(ofSize: 14)

        return statusLabelText
    }()

    private lazy var statusTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.font = UIFont.systemFont(ofSize: 15)
        textField.textColor = .black
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 12
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor(named: "black")?.cgColor
        textField.keyboardType = .default
        textField.returnKeyType = .done
        textField.placeholder = NSLocalizedString("Input Status", comment: "")

        return textField
    }()

    private lazy var setStatusButton: UIButton = {
        let setStatusButton = UIButton()
        setStatusButton.translatesAutoresizingMaskIntoConstraints = false
        setStatusButton.backgroundColor = UIColor(red: 0/255, green: 132/255, blue: 247/255, alpha: 1)
        setStatusButton.setTitle(NSLocalizedString("Set Status", comment: ""), for: .normal)
        setStatusButton.titleLabel?.textColor = .white
        setStatusButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        setStatusButton.layer.shadowRadius = 4
        setStatusButton.layer.shadowColor = UIColor(named: "black")?.cgColor
        setStatusButton.layer.shadowOpacity = 0.7
        setStatusButton.layer.cornerRadius = 10

        return setStatusButton
    }()

    // MARK: - Lyfecicle

    init(viewModel: ProfileTableViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        backgroundColor = .secondarySystemBackground
        addSubViews()
        setUpConstraints()
        statusTextField.addTarget(self, action: #selector(statusTextChanged(_:)), for: .editingChanged)
        setStatusButton.addTarget(self, action: #selector(statusButtonPressed(_:)), for: .touchUpInside)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


// MARK: - Functions

extension ProfileTableHeaderView {

    @objc func statusTextChanged(_ textField: UITextField) {
        statusText = textField.text
    }

    @objc func statusButtonPressed(_ sender: UIButton) {
        UIView.animate(withDuration: 0.4) {
            self.setStatusButton.transform = CGAffineTransform(scaleX: 1.25, y: 1.25)
            self.setStatusButton.backgroundColor = UIColor(red: 70/255, green: 130/255, blue: 180/255, alpha: 1)
            self.setStatusButton.transform = CGAffineTransform(scaleX: 1, y: 1)
            self.setStatusButton.backgroundColor = UIColor(red: 0/255, green: 132/255, blue: 247/255, alpha: 1)
        }
            if let text = statusText {
                let store = FiresService().dataBase.collection(.collectionName)
                let newEvent = Event(name: self.viewModel.user.fullName, status: statusTextField.text!)
                do {
                    try store.addDocument(from: newEvent)
                } catch {
                    print(error.localizedDescription)
                }
                self.statusLabelText.text = text
            } else {
                print("There is no text")
            }

    }

    func setUpConstraints() {
        viewModel.updateView(self)
        NSLayoutConstraint.activate([
            profileImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            profileImage.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            profileImage.bottomAnchor.constraint(equalTo: setStatusButton.topAnchor, constant: -16),
            profileImage.widthAnchor.constraint(equalToConstant: 150),
            profileImage.heightAnchor.constraint(equalToConstant: 150),

            nameLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 27),
            nameLabel.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 16),

            statusLabelText.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 16),
            statusLabelText.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),

            statusTextField.topAnchor.constraint(equalTo: statusLabelText.bottomAnchor, constant: 26),
            statusTextField.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            statusTextField.heightAnchor.constraint(equalToConstant: 40),
            statusTextField.widthAnchor.constraint(equalToConstant: 200),

            setStatusButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            setStatusButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            setStatusButton.bottomAnchor.constraint(equalTo:  safeAreaLayoutGuide.bottomAnchor, constant: -12)
        ])
    }

    func addSubViews() {
        addSubview(nameLabel)
        addSubview(statusLabelText)
        addSubview(statusTextField)
        addSubview(setStatusButton)
        addSubview(profileImage)
    }
}



