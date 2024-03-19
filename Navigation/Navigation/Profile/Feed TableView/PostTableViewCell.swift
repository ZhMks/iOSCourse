//
//  BaseTableViewCell.swift
//  Navigation
//
//  Created by Максим Жуин on 11.09.2023.
//

import Foundation
import UIKit

class PostTableViewCell: UITableViewCell {

    // MARK: - Properties

    static let id = "BaseTableViewCell"

    private lazy var authorName: UILabel = {
        let authorName = UILabel()
        authorName.translatesAutoresizingMaskIntoConstraints = false
        authorName.font = UIFont.boldSystemFont(ofSize: 20)
        authorName.textColor = .black
        authorName.numberOfLines = 2
        return authorName
    }()

    private lazy var feedImageView: UIImageView = {
        let feedImageView = UIImageView()
        feedImageView.translatesAutoresizingMaskIntoConstraints = false
        feedImageView.contentMode = .scaleAspectFit
        feedImageView.backgroundColor = .black

        return feedImageView
    }()

    lazy var starImage: UIImageView = {
        let starImage = UIImageView(image: UIImage(systemName: "star.fill"))
        starImage.translatesAutoresizingMaskIntoConstraints = false
        let color = UIColor(red: 135/255, green: 206/255, blue: 250/255, alpha: 1)
        starImage.tintColor = color
        starImage.isHidden = true
        return starImage
    }()

    private lazy var feedImageViewLabel: UILabel = {
        let feedImageViewLabel = UILabel()
        feedImageViewLabel.translatesAutoresizingMaskIntoConstraints = false
        feedImageViewLabel.font = UIFont.systemFont(ofSize: 14)
        feedImageViewLabel.textColor = .systemGray
        feedImageViewLabel.numberOfLines = 0
        return feedImageViewLabel
    }()

    private lazy var bottomLikesLabel: UILabel = {
        let bottomLikesLabel = UILabel()
        bottomLikesLabel.translatesAutoresizingMaskIntoConstraints = false
        bottomLikesLabel.textColor = .black
        bottomLikesLabel.font = UIFont.systemFont(ofSize: 16)
        return bottomLikesLabel
    }()

    private lazy var bottomViewsLabel: UILabel = {
        let bottomViewsLabel = UILabel()
        bottomViewsLabel.translatesAutoresizingMaskIntoConstraints = false
        bottomViewsLabel.textColor = .black
        bottomViewsLabel.font = UIFont.systemFont(ofSize: 16)
        return bottomViewsLabel
    }()

    // MARK: - LifeCycle

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



extension PostTableViewCell{

    // MARK: - Functions

    private func setupUI(){
        contentView.addSubview(feedImageView)
        contentView.addSubview(feedImageViewLabel)
        contentView.addSubview(bottomLikesLabel)
        contentView.addSubview(bottomViewsLabel)
        contentView.addSubview(authorName)
        feedImageView.addSubview(starImage)

        NSLayoutConstraint.activate([
            authorName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            authorName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            authorName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            authorName.heightAnchor.constraint(equalToConstant: 50),

            feedImageView.topAnchor.constraint(equalTo: authorName.bottomAnchor, constant: 12),
            feedImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            feedImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            feedImageView.heightAnchor.constraint(equalToConstant: 200),

            feedImageViewLabel.topAnchor.constraint(equalTo: feedImageView.bottomAnchor, constant: 16),
            feedImageViewLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            feedImageViewLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            feedImageViewLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -50),

            bottomLikesLabel.topAnchor.constraint(equalTo: feedImageViewLabel.bottomAnchor, constant: 16),
            bottomLikesLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            bottomLikesLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),

            bottomViewsLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            bottomViewsLabel.topAnchor.constraint(equalTo: feedImageViewLabel.bottomAnchor, constant: 16),
            bottomViewsLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),

            starImage.centerXAnchor.constraint(equalTo: feedImageView.centerXAnchor),
            starImage.centerYAnchor.constraint(equalTo: feedImageView.centerYAnchor),
            starImage.heightAnchor.constraint(equalToConstant: 50),
            starImage.widthAnchor.constraint(equalToConstant: 50)
        ])
    }

    func configure(author: String, title: String, imageName: String, likes: Int, views: Int) {
        authorName.text = author
        feedImageViewLabel.text = title
        feedImageView.image = UIImage(named: imageName)
        bottomLikesLabel.text = localizePlurals(key: "LikesNumber", number: likes)
        bottomViewsLabel.text = localizePlurals(key: "ViewsNumber", number: views)
    }

    func localizePlurals(key: String, number: Int) -> String {
        let localizedString = NSLocalizedString(key, tableName: "PostCellRU", comment: "")
        return String(format: localizedString, number)
    }
}
