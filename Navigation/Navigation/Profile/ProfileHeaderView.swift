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
    
    lazy var statusButton: UIButton = {
        let statusButton = UIButton()
        statusButton.translatesAutoresizingMaskIntoConstraints = false
        statusButton.backgroundColor = UIColor.blue
        statusButton.setTitle("Show status", for: .normal)
        statusButton.titleLabel?.textColor = .white
        statusButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        statusButton.layer.shadowRadius = 4
        statusButton.layer.shadowColor = UIColor(named: "black")?.cgColor
        statusButton.layer.shadowOpacity = 0.7
        statusButton.layer.cornerRadius = 4
        
        return statusButton
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
    
    @objc func statusTextChanged(_ textField: UITextField) {
        statusText = textField.text
    }
    
    @objc func buttonPressed(_ sender: UIButton) {
        UIView.animate(withDuration: 0.4) {
            self.statusButton.transform = CGAffineTransform(scaleX: 1.25, y: 1.25)
            self.statusButton.backgroundColor = UIColor(red: 70/255, green: 130/255, blue: 180/255, alpha: 1)
            self.statusButton.transform = CGAffineTransform(scaleX: 1, y: 1)
            self.statusButton.backgroundColor = .blue
            print(self.statusLabelText.text!)
        }
    }
    
    @objc func statusButtonPressed(_ sender: UIButton) {
        UIView.animate(withDuration: 0.4) { [self] in
            self.statusChangeButton.transform = CGAffineTransform(scaleX: 1.25, y: 1.25)
            self.statusChangeButton.backgroundColor = UIColor(red: 70/255, green: 130/255, blue: 180/255, alpha: 1)
            self.statusChangeButton.transform = CGAffineTransform(scaleX: 1, y: 1)
            self.statusChangeButton.backgroundColor = .blue
            statusLabelText.text = self.statusText
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(profileImage)
        addSubview(nameLabel)
        addSubview(statusButton)
        addSubview(statusLabelText)
        addSubview(statusTextField)
        addSubview(statusChangeButton)
        statusButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        statusTextField.addTarget(self, action: #selector(statusTextChanged(_:)), for: .editingChanged)
        statusChangeButton.addTarget(self, action: #selector(statusButtonPressed(_:)), for: .touchUpInside)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
