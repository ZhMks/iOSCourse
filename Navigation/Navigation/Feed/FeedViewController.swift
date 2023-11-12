//
//  FeedViewController.swift
//  Navigation
//
//  Created by Максим Жуин on 26.08.2023.
//

import UIKit

class FeedViewController: UIViewController {

    lazy var feedModel = FeedModel()

    struct Post {
        var title: String?
    }

    private lazy var textField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.font = UIFont.systemFont(ofSize: 15)
        textField.textColor = .black
        textField.backgroundColor = .systemGray3
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor(named: "black")?.cgColor
        textField.keyboardType = .default
        textField.returnKeyType = .done
        textField.placeholder = "Please enter text"
        return textField
    }()

    private lazy var uiStackView: UIStackView = {
        let stack = UIStackView()
        let topButton = GoToPostButton(title: "Go to Post", backgroundColor: .blue, frame: nil) {
            let postViewController = PostViewController()
            let post1 = Post(title: "Заголовок поста")
            postViewController.title = post1.title
            self.navigationController?.pushViewController(postViewController, animated: true)
        }
        let checkGuessButton = GoToPostButton(title: "Check Pass", backgroundColor: .blue, frame: nil) {
            self.textField.resignFirstResponder()
            if let text = self.textField.text {
                if self.feedModel.check(word: text) {
                    topButton.backgroundColor = .green
                } else {
                    topButton.backgroundColor = .red
                }
            }
        }
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.addArrangedSubview(textField)
        stack.addArrangedSubview(topButton)
        stack.addArrangedSubview(checkGuessButton)
        stack.axis = .vertical
        stack.spacing = 10
        stack.distribution = .fillProportionally
        return stack
    }()

    let hamsterImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "hamster")
        imageView.layer.cornerRadius = 80
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.systemBackground
        view.addSubview(hamsterImage)
        view.addSubview(uiStackView)
        imageViewPositionChange()
    }

    
    // MARK: - Func
    
    func imageViewPositionChange() {
        let safeAreaLayoutGuide = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            hamsterImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 80),
            hamsterImage.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 80),
            hamsterImage.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -80),
            hamsterImage.heightAnchor.constraint(equalToConstant: 150),

            uiStackView.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor),
            uiStackView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor)
        ])
    }
}
