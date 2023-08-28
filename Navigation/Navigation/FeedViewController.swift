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
        let button = UIButton(type: .system)
        return button
    }()
    
    let imageView = UIImageView(image: .init(named: "hamster"))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.systemBackground
        title = "Новости"
        navigationItem.title = "Новости"
        view.addSubview(button)
        view.addSubview(imageView)
        
        buttonChange()
        
        imageViewChange()
        
        button.addTarget(self, action: #selector(onPressed(_:)), for: .touchUpInside)
    }
        
    func buttonChange() {
        let safeAreaLayoutGuide = view.safeAreaLayoutGuide
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("К посту", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 55)
        button.setTitleColor(.black, for: .normal)
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 2.2
            
        NSLayoutConstraint.activate([
            button.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 40),
            button.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -40),
            button.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 300),
            button.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -200),
        ])
    }
    
    func imageViewChange() {
        let safeAreaLayoutGuide = view.safeAreaLayoutGuide
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 80),
            imageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 40),
            imageView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -40),
            imageView.heightAnchor.constraint(equalToConstant: 200),
            imageView.widthAnchor.constraint(equalToConstant: 100),
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
