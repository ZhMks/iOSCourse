//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Максим Жуин on 21.09.2023.
//

import Foundation
import UIKit

class PhotosTableViewCell: UITableViewCell {

    // MARK: - Properties

static let id = "PhotosTableViewCell"

    let spacing = 8.0

    private lazy var photosImageViewFirst: UIImageView = {
        let photosImageView = UIImageView()
        photosImageView.translatesAutoresizingMaskIntoConstraints = false
        photosImageView.clipsToBounds = true
        photosImageView.layer.cornerRadius = 6

        return photosImageView
    }()

    private lazy var photosImageViewSecond: UIImageView = {
        let photosImageView = UIImageView()
        photosImageView.translatesAutoresizingMaskIntoConstraints = false
        photosImageView.clipsToBounds = true
        photosImageView.layer.cornerRadius = 6

        return photosImageView
    }()

    private lazy var photosImageViewThird: UIImageView = {
        let photosImageView = UIImageView()
        photosImageView.translatesAutoresizingMaskIntoConstraints = false
        photosImageView.clipsToBounds = true
        photosImageView.layer.cornerRadius = 6

        return photosImageView
    }()

    private lazy var photosImageViewFourth: UIImageView = {
        let photosImageView = UIImageView()
        photosImageView.translatesAutoresizingMaskIntoConstraints = false
        photosImageView.clipsToBounds = true
        photosImageView.layer.cornerRadius = 6

        return photosImageView
    }()

    private lazy var photosLabel: UILabel = {
        let photosLabel = UILabel()
        photosLabel.translatesAutoresizingMaskIntoConstraints = false
        photosLabel.font = UIFont.boldSystemFont(ofSize: 24)
        photosLabel.text = "Photos"
        photosLabel.textColor = .black

        return photosLabel
    }()

    private lazy var cellButton: UIButton = {
        let cellButton = UIButton()
        cellButton.translatesAutoresizingMaskIntoConstraints = false
        let image = UIImage(systemName: "arrow.right")
        image?.withTintColor(.black)
        cellButton.setImage(image, for: .normal)

        return cellButton
    }()

    // MARK: - LifeCycle

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: -Funcs

    private func setupUI() {
        addSubview(photosLabel)
        addSubview(photosImageViewFirst)
        addSubview(photosImageViewSecond)
        addSubview(photosImageViewThird)
        addSubview(photosImageViewFourth)
        addSubview(cellButton)
        let width = CGFloat((UIScreen.main.bounds.width - 46) / 4)
        let height = width

        NSLayoutConstraint.activate([
            photosLabel.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            photosLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),

            cellButton.centerYAnchor.constraint(equalTo: photosLabel.centerYAnchor),
            cellButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),

            photosImageViewFirst.topAnchor.constraint(equalTo: photosLabel.bottomAnchor, constant: 12),
            photosImageViewFirst.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            photosImageViewFirst.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12),
            photosImageViewFirst.heightAnchor.constraint(equalToConstant: height),
            photosImageViewFirst.widthAnchor.constraint(equalToConstant: width),

            photosImageViewSecond.topAnchor.constraint(equalTo: photosLabel.bottomAnchor, constant: 12),
            photosImageViewSecond.leadingAnchor.constraint(equalTo: photosImageViewFirst.trailingAnchor, constant: spacing),
            photosImageViewSecond.heightAnchor.constraint(equalToConstant: height),
            photosImageViewSecond.widthAnchor.constraint(equalToConstant: width),


            photosImageViewThird.topAnchor.constraint(equalTo: photosLabel.bottomAnchor, constant: 12),
            photosImageViewThird.leadingAnchor.constraint(equalTo: photosImageViewSecond.trailingAnchor, constant: spacing),
            photosImageViewThird.heightAnchor.constraint(equalToConstant: height),
            photosImageViewThird.widthAnchor.constraint(equalToConstant: width),


            photosImageViewFourth.topAnchor.constraint(equalTo: photosLabel.bottomAnchor, constant: 12),
            photosImageViewFourth.leadingAnchor.constraint(equalTo: photosImageViewThird.trailingAnchor, constant: spacing),
            photosImageViewFourth.heightAnchor.constraint(equalToConstant: height),
            photosImageViewFourth.widthAnchor.constraint(equalToConstant: width)
        ])
    }

    func configureCell(photo: [Photos]) {
        let imageViews = [photosImageViewFirst, photosImageViewSecond, photosImageViewThird, photosImageViewFourth]

        for (index, imageView) in imageViews.enumerated() {
            imageView.image = photo[index].photoView
        }
    }
}
