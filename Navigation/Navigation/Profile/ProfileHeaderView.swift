//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Максим Жуин on 02.09.2023.
//

import UIKit

class ProfileHeaderView: UIView {
    private var statusText: String?
    
    lazy var nameLabel: UILabel = {
        let name = UILabel()
        name.translatesAutoresizingMaskIntoConstraints = false
        name.text = "Hipster copybara"
        name.font = UIFont.boldSystemFont(ofSize: 16)
        name.textColor = .black
        
        return name
    }()
    
    lazy var profileImage: UIImageView = {
        let profileImage = UIImage(named: "copybara")
        let profileView = UIImageView()
        profileView.image = profileImage
        profileView.translatesAutoresizingMaskIntoConstraints = false
        profileView.layer.borderColor = UIColor(white: 100, alpha: 1).cgColor
        profileView.layer.borderWidth = 3
        profileView.layer.cornerRadius = 75
        profileView.layer.masksToBounds = true
        
        return profileView
    }()
    
    lazy var statusLabelText: UILabel = {
        let statusLabelText = UILabel()
        statusLabelText.translatesAutoresizingMaskIntoConstraints = false
        statusLabelText.text = "Waiting for something..."
        statusLabelText.textColor = .gray
        statusLabelText.font = UIFont.systemFont(ofSize: 14)
        
        return statusLabelText
    }()
    
    lazy var statusTextField: UITextField = {
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
        textField.placeholder = " Input your status"
        
        return textField
    }()
    
    lazy var statusChangeButton: UIButton = {
        let statusChangeButton = UIButton()
        statusChangeButton.translatesAutoresizingMaskIntoConstraints = false
        statusChangeButton.backgroundColor = UIColor.blue
        statusChangeButton.setTitle("Set status", for: .normal)
        statusChangeButton.titleLabel?.textColor = .white
        statusChangeButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        statusChangeButton.layer.shadowRadius = 4
        statusChangeButton.layer.shadowColor = UIColor(named: "black")?.cgColor
        statusChangeButton.layer.shadowOpacity = 0.7
        statusChangeButton.layer.cornerRadius = 4
        
        return statusChangeButton
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(profileImage)
        addSubview(nameLabel)
        addSubview(statusLabelText)
        addSubview(statusTextField)
        addSubview(statusChangeButton)
        setUpConstraints()
        statusTextField.addTarget(self, action: #selector(statusTextChanged(_:)), for: .editingChanged)
        statusChangeButton.addTarget(self, action: #selector(statusButtonPressed(_:)), for: .touchUpInside)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func statusTextChanged(_ textField: UITextField) {
        statusText = textField.text
    }
    
    @objc func statusButtonPressed(_ sender: UIButton) {
        UIView.animate(withDuration: 0.4) { [self] in
            self.statusChangeButton.transform = CGAffineTransform(scaleX: 1.25, y: 1.25)
            self.statusChangeButton.backgroundColor = UIColor(red: 70/255, green: 130/255, blue: 180/255, alpha: 1)
            self.statusChangeButton.transform = CGAffineTransform(scaleX: 1, y: 1)
            self.statusChangeButton.backgroundColor = .blue
            if let text = statusText {
                statusLabelText.text = text
            } else {
                print("There is no text")
            }
        }
    }
    
    func setUpConstraints() {
        let safeAreaLayout = self.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            profileImage.topAnchor.constraint(equalTo: safeAreaLayout.topAnchor, constant: 16),
            profileImage.leadingAnchor.constraint(equalTo: safeAreaLayout.leadingAnchor, constant: 16),
            profileImage.heightAnchor.constraint(equalToConstant: 150),
            profileImage.widthAnchor.constraint(equalToConstant: 150),
            
            nameLabel.topAnchor.constraint(equalTo: safeAreaLayout.topAnchor, constant: 27),
            nameLabel.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 16),
            
            statusLabelText.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 16),
            statusLabelText.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 40),
            
            statusTextField.topAnchor.constraint(equalTo: statusLabelText.bottomAnchor, constant: 26),
            statusTextField.trailingAnchor.constraint(equalTo: safeAreaLayout.trailingAnchor, constant: -16),
            statusTextField.heightAnchor.constraint(equalToConstant: 40),
            statusTextField.widthAnchor.constraint(equalToConstant: 200),
            
            statusChangeButton.leadingAnchor.constraint(equalTo: safeAreaLayout.leadingAnchor, constant: 16),
            statusChangeButton.trailingAnchor.constraint(equalTo: safeAreaLayout.trailingAnchor, constant: -16),
            statusChangeButton.topAnchor.constraint(equalTo: statusLabelText.bottomAnchor, constant: 86)
        ])
    }
}
