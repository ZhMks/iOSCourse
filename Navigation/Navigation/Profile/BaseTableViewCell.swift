//
//  BaseTableViewCell.swift
//  Navigation
//
//  Created by Максим Жуин on 11.09.2023.
//

import Foundation
import UIKit

class BaseTableViewCell: UITableViewCell {

    // MARK: - Properties

    static let id = "BaseTableViewCell"

    private lazy var feedImageView: UIImageView = {
        let feedImageView = UIImageView()
        feedImageView.translatesAutoresizingMaskIntoConstraints = false
        return feedImageView
    }()

    private lazy var feedImageViewLabel: UILabel = {
        let feedImageViewLabel = UILabel()
        feedImageViewLabel.translatesAutoresizingMaskIntoConstraints = false
        return feedImageViewLabel
    }()

    private lazy var bottomLikesLabel: UILabel = {
        let bottomLikesLabel = UILabel()
        bottomLikesLabel.translatesAutoresizingMaskIntoConstraints = false
        return bottomLikesLabel
    }()

    private lazy var bottomViewsLabel: UILabel = {
        let bottomViewsLabel = UILabel()
        bottomViewsLabel.translatesAutoresizingMaskIntoConstraints = false
        return bottomViewsLabel
    }()

    // MARK: - LifeCycle

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

    extension BaseTableViewCell{

        // MARK: - Functions

        private func setupUI(){
            contentView.addSubview(feedImageView)
            contentView.addSubview(feedImageViewLabel)
            contentView.addSubview(bottomLikesLabel)
            contentView.addSubview(bottomViewsLabel)

            let safeAreaLayout = safeAreaLayoutGuide
            NSLayoutConstraint.activate([
                feedImageView.topAnchor.constraint(equalTo: safeAreaLayout.topAnchor, constant: 12),
                feedImageView.leadingAnchor.constraint(equalTo: safeAreaLayout.leadingAnchor),
                feedImageView.trailingAnchor.constraint(equalTo: safeAreaLayout.trailingAnchor),

                feedImageViewLabel.topAnchor.constraint(equalTo: feedImageView.bottomAnchor, constant: 16),
                feedImageViewLabel.leadingAnchor.constraint(equalTo: safeAreaLayout.leadingAnchor, constant: 16),

                bottomLikesLabel.topAnchor.constraint(equalTo: feedImageViewLabel.bottomAnchor, constant: 16),
                bottomLikesLabel.leadingAnchor.constraint(equalTo: safeAreaLayout.leadingAnchor, constant: 16),
                bottomLikesLabel.bottomAnchor.constraint(equalTo: safeAreaLayout.bottomAnchor, constant: -16),

                bottomViewsLabel.trailingAnchor.constraint(equalTo: safeAreaLayout.trailingAnchor, constant: -16),
                bottomViewsLabel.topAnchor.constraint(equalTo: feedImageView.bottomAnchor, constant: 16),
                bottomViewsLabel.bottomAnchor.constraint(equalTo: safeAreaLayout.bottomAnchor, constant: -16)
            ])
        }

        func configure(title: String, color: UIColor, likes: String, views: String) {
            feedImageViewLabel.text = title
            feedImageView.backgroundColor = color
            bottomLikesLabel.text = likes
            bottomViewsLabel.text = views
        }
}
