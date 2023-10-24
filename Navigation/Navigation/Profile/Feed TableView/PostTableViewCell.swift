//
//  BaseTableViewCell.swift
//  Navigation
//
//  Created by Максим Жуин on 11.09.2023.
//

import iOSIntPackage
import UIKit
import SnapKit

class PostTableViewCell: UITableViewCell {

    // MARK: - Properties

    static let id = "BaseTableViewCell"
    let imgProcessor = ImageProcessor()

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

            authorName.snp.makeConstraints { make in
                make.top.equalTo(contentView.snp.top).offset(16)
                make.trailing.equalTo(contentView.snp.trailing)
                make.leading.equalTo(contentView.snp.leading).offset(12)
                make.height.equalTo(50)
            }
            feedImageView.snp.makeConstraints { make in
                make.leading.trailing.equalTo(contentView)
                make.height.equalTo(200)
                make.top.equalTo(authorName.snp.bottom).offset(12)
            }
            feedImageViewLabel.snp.makeConstraints { make in
                make.top.equalTo(feedImageView.snp.bottom).offset(16)
                make.leading.equalTo(contentView.snp.leading).offset(16)
                make.trailing.equalTo(contentView.snp.trailing).offset(-16)
                make.bottom.equalTo(contentView.snp.bottom).offset(-50)
            }
            bottomLikesLabel.snp.makeConstraints { make in
                make.leading.equalTo(contentView.snp.leading).offset(16)
                make.top.equalTo(feedImageViewLabel.snp.bottom).offset(16)
                make.bottom.equalTo(contentView.snp.bottom).offset(-16)
            }
            bottomViewsLabel.snp.makeConstraints { make in
                make.trailing.trailing.equalTo(contentView.snp.trailing).offset(-16)
                make.top.equalTo(feedImageViewLabel.snp.bottom).offset(16)
                make.bottom.equalTo(contentView.snp.bottom).offset(-16)
            }
        }

        func configure(author: String, title: String, imageName: String, likes: Int, views: Int) {
            authorName.text = author
            feedImageViewLabel.text = title
            feedImageView.image = UIImage(named: imageName)
            bottomLikesLabel.text = "Likes: \(likes)"
            bottomViewsLabel.text = "Views: \(views)"
            imgProcessor.processImage(sourceImage: feedImageView.image!, filter: .noir) { image in
                var processedImage = image
                feedImageView.image = processedImage
            }
        }
}
