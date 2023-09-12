//
//  TableView.swift
//  Navigation
//
//  Created by Максим Жуин on 12.09.2023.
//

import Foundation
import UIKit

class TableView: UIView {

    var dataSource : [FeedDataSource] = [
        FeedDataSource(imageColor: .black, titleImage: "SimpleTitle",         bottomLikesLabel: "Likes: 121", bottomViewsLabel: "Views: 122"),
        FeedDataSource(imageColor: .blue,  titleImage: "SimpleTitleFor2Cell", bottomLikesLabel: "Likes: 121", bottomViewsLabel: "Views: 122"),
        FeedDataSource(imageColor: .green, titleImage: "SimpleTitleFor3Cell", bottomLikesLabel: "Likes: 121", bottomViewsLabel: "Views: 122"),
        FeedDataSource(imageColor: .brown, titleImage: "SimpleTitleFor4Cell", bottomLikesLabel: "Likes: 121", bottomViewsLabel: "Views: 122")
    ]

    private lazy var postTableView: UITableView = {
        let postTableView = UITableView()
        postTableView.translatesAutoresizingMaskIntoConstraints = false

        return postTableView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(postTableView)
        setupUI()
        postTableView.register(BaseTableViewCell.self, forCellReuseIdentifier: BaseTableViewCell.id)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension TableView: UITableViewDelegate, UITableViewDataSource {

    func setupUI(){
        let safeAreaLayout = safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            postTableView.topAnchor.constraint(equalTo: safeAreaLayout.topAnchor),
            postTableView.bottomAnchor.constraint(equalTo: safeAreaLayout.bottomAnchor),
            postTableView.leadingAnchor.constraint(equalTo: safeAreaLayout.leadingAnchor),
            postTableView.trailingAnchor.constraint(equalTo: safeAreaLayout.trailingAnchor)
        ])
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: BaseTableViewCell.id, for: indexPath) as? BaseTableViewCell else { return UITableViewCell() }
        let setting = dataSource[indexPath.row]
        cell.configure (title: setting.titleImage!,
                        color: setting.imageColor!,
                        likes: setting.bottomLikesLabel!,
                        views: setting.bottomViewsLabel!
        )
        return cell
    }
}
