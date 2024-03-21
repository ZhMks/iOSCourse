//
//  NetworkServiceModel.swift
//  Navigation
//
//  Created by Максим Жуин on 25.12.2023.
//

import Foundation


struct PlanetInformation: Codable {

    let orbitPeriod: String

    let citizens: [URL]

    private enum CodingKeys: String, CodingKey {
        case citizens = "residents"
        case orbitPeriod = "orbital_period"
    }
}

struct Citizen: Codable {
    var name: String
    var birthYear: String

    private enum CodingKeys: String, CodingKey {
        case birthYear = "birth_year"
        case name = "name"
    }
}
