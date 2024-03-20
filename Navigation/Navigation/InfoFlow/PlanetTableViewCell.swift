//
//  PlanetTableViewCell.swift
//  Navigation
//
//  Created by Максим Жуин on 04.01.2024.
//

import UIKit


class PlanetTableViewCell: UITableViewCell {
    let id = "PlanetTableViewCell"

    private var nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.textColor = ColorCreator.textColor
        return nameLabel
    }()

    private var age: UILabel = {
        let age = UILabel()
        age.translatesAutoresizingMaskIntoConstraints = false
        age.textColor = ColorCreator.textColor
        return age
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        updateUI()
    }

    func updateUI() {
        contentView.addSubview(nameLabel)
        contentView.addSubview(age)

        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            nameLabel.bottomAnchor.constraint(equalTo: age.topAnchor, constant: -20),

            age.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 15),
            age.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            age.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
        ])
    }

    func configure(with citizen: Citizen) {
        self.nameLabel.text = citizen.name
        self.age.text = "Date of BIRTH: \(citizen.birthYear)"
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
