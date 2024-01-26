//
//  FavouritesViewController.swift
//  Navigation
//
//  Created by Максим Жуин on 26.01.2024.
//

import UIKit

class FavouritesViewController: UIViewController {

    private lazy var favouriteTableView: UITableView = {
        let favouritePostsTableView = UITableView()
        favouritePostsTableView.translatesAutoresizingMaskIntoConstraints = false
        favouritePostsTableView.delegate = self
        favouritePostsTableView.dataSource = self
        favouriteTableView.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.id)
        return favouritePostsTableView
    }()

    private var favouriteViewModel: FavouritesViewModel

    init(favouriteViewModel: FavouritesViewModel) {
        self.favouriteViewModel = favouriteViewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        favouriteTableView.reloadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
    }

}

extension FavouritesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            favouriteViewModel.favouriteModelService.deletePostAt(index: indexPath.row)
            tableView.reloadData()
        }
    }
}

extension FavouritesViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch favouriteViewModel.state {
        case .initial:
            return 0
        case .red:
            return 0
        case .green:
            return favouriteViewModel.favouritePosts.count
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.id, for: indexPath) as? PostTableViewCell else { return UITableViewCell() }
        let infoForCell = favouriteViewModel.favouritePosts[indexPath.row]
        cell.configure(author: infoForCell.authorName!, title: infoForCell.postText!, imageName: infoForCell.image!, likes: Int(infoForCell.numberOfLikes), views: Int(infoForCell.numberOfViews))
        return cell
    }
}
