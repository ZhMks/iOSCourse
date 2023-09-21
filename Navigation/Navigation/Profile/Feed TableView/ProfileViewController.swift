//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Максим Жуин on 26.08.2023.
//

import UIKit

class ProfileViewController: UIViewController {

    // MARK: - Properties

    private var dataSource: [Post] = [
        Post(author: "Wedmak.Official",
             imgae: "Film1",
             description: "Новые кадры со съемок второго сезона сериала \"Ведьмак\" ",
             likes: 121,
             views: 121),
        Post(author: "Netology",
             imgae: "Netology1",
             description: """
             От 'Hello, World' до первого сложного iOS-приложения - всего один курс. Если чувствуете в себе силу для покорения топов AppStore - пора начинать действовать! Профессия «iOS-разработчик» - тот самый путь, по которому стоит пройти до самого
             конца. Вы научитесь создавать приложения на языке Swift с нуля: от начинки до интерфейса. Чтобы закрепить знания на практике, каждый студент подготовит дипломную работу - VK-like приложение с возможностью публиковать фотографии, использовать фильтры, ставить лайки и подписываться на других
             пользователей.
             """,
             likes: 120, views: 120),
        Post(author: "SimpleTextAuthor",
             imgae: "Film2",
             description: "TEKSTTEKSTTEKSTTEKSTTEKSTTEKSTTEKST",
             likes: 222,
             views: 223),
        Post(author: "AUTHOR$",
             imgae: "Film3",
             description: "SIMPLETEXT SIMPLETEXT SIMPLETEXT SIMPLETEXT SIMPLETEXT",
             likes: 2222,
             views: 2234)
    ]

    private lazy var postTableView: UITableView = {
        let postTableView = UITableView(frame: .zero, style: .grouped)
        postTableView.translatesAutoresizingMaskIntoConstraints = false

        return postTableView
    }()

    // MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(postTableView)
        setupConstraints()
        tuneTableView()
    }
}

// MARK: - Functions

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    func tuneTableView() {
        postTableView.rowHeight = UITableView.automaticDimension
        postTableView.estimatedRowHeight = 12
        let header = ProfileTableHeaderView()
        postTableView.setAndLayout(header: header)
        postTableView.tableFooterView = UIView()
        postTableView.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.id)
        postTableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: PhotosTableViewCell.id)
        postTableView.dataSource = self
        postTableView.delegate = self
        postTableView.sectionFooterHeight = 2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           if section == 0 {
               return 1
           } else {
               return dataSource.count
           }
       }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: PhotosTableViewCell.id, for: indexPath) as? PhotosTableViewCell else { return UITableViewCell() }
            let photoArray = Photos.makeArray()
            cell.configureCell(photo: photoArray)
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.id, for: indexPath) as? PostTableViewCell else { return UITableViewCell() }
            let setting = dataSource[indexPath.row]
            cell.configure(
                author: setting.author,
                title: setting.description,
                imageName: setting.imgae,
                likes: setting.likes,
                views: setting.views
            )
            return cell
        }
    }

    func setupConstraints() {
        let safeAreaLayout = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            postTableView.topAnchor.constraint(equalTo: safeAreaLayout.topAnchor),
            postTableView.leadingAnchor.constraint(equalTo: safeAreaLayout.leadingAnchor),
            postTableView.trailingAnchor.constraint(equalTo: safeAreaLayout.trailingAnchor),
            postTableView.bottomAnchor.constraint(equalTo: safeAreaLayout.bottomAnchor)
        ])
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            let photosViewController = PhotosViewController()
            navigationController?.pushViewController(photosViewController, animated: true)
        }
    }
}
