//
//  FeedViewController.swift
//  Navigation
//
//  Created by Максим Жуин on 26.08.2023.
//

import UIKit

class FeedViewController: UIViewController {
    struct Post {
        var title: String?
    }
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 10.0
        button.layer.backgroundColor = UIColor(red: 255/255, green: 152/255, blue: 153/255, alpha: 1).cgColor
        button.setTitle("К посту", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 36)
        button.setTitleColor(.black, for: .normal)
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 2.2
        return button
    }()
    
    let hamsterImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "hamster")
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.systemBackground
        title = "Новости"
        navigationItem.title = "Новости"
        view.addSubview(button)
        view.addSubview(hamsterImage)
        
        buttonPositionChange()
        
        imageViewPositionChange()
        
        button.addTarget(self, action: #selector(onPressed(_:)), for: .touchUpInside)
    }
        
    func buttonPositionChange() {
        let safeAreaLayoutGuide = view.safeAreaLayoutGuide
        button.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            button.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 40),
            button.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -40),
            button.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 300),
            button.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -200),
        ])
    }
    
    func imageViewPositionChange() {
        let safeAreaLayoutGuide = view.safeAreaLayoutGuide
        
        hamsterImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            hamsterImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 80),
            hamsterImage.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 40),
            hamsterImage.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -40),
            hamsterImage.heightAnchor.constraint(equalToConstant: 200),
            hamsterImage.widthAnchor.constraint(equalToConstant: 100),
        ])
    }
    
    @objc func onPressed(_ sender: UIButton) {
        if sender.isTouchInside {
            let postViewController = PostViewController()
            let post1 = Post(title: "Заголовок поста")
            postViewController.title = post1.title
            navigationController?.pushViewController(postViewController, animated: true)
        }
    }
}
