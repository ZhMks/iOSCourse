//
//  FeedViewController.swift
//  Navigation
//
//  Created by Максим Жуин on 26.08.2023.
//

import UIKit

class FeedViewController: UIViewController {
    
    let button = UIButton(type: .system)
    let imageView = UIImageView(image: .init(named: "hamster"))
    
    struct Post {
       var title: String?
   }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Feed"
        view.backgroundColor = .systemBackground
        view.addSubview(button)
        view.addSubview(imageView)
        self.navigationItem.title = "Новости"
        buttonChange()
        imageViewChange()
        button.addTarget(self, action: #selector(onPressed(_:)), for: .touchUpInside)
    }
        
        func buttonChange() {
            button.translatesAutoresizingMaskIntoConstraints = false
            button.setTitle("To Post", for: .normal)
            button.titleLabel?.font = UIFont.systemFont(ofSize: 55)
            button.setTitleColor(.black, for: .normal)
            button.layer.borderColor = UIColor.black.cgColor
            button.layer.borderWidth = 2.2
            
            NSLayoutConstraint.activate([
                button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
                button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
                button.topAnchor.constraint(equalTo: view.topAnchor, constant: 400),
                button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -400),
            ])
        }
    
    func imageViewChange() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
        imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
        imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
        imageView.heightAnchor.constraint(equalToConstant: 200),
        imageView.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    @objc func onPressed(_ sender: UIButton) {
        if sender.isTouchInside {
            let postViewController = PostViewController()
            self.present(postViewController, animated: true, completion: nil)
            let post1 = Post(title: "Post Title")
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
