//
//  NetworkService.swift
//  Navigation
//
//  Created by Максим Жуин on 18.12.2023.
//

import Foundation


enum NetworkServiceErrors: Error {

    case dataError
    case responseError
    case invalidLink
    case unknownError

    var description: String {
        switch self {
        case .dataError:
            "Cannot decode data"
        case .responseError:
            "Internal Server Error"
        case .invalidLink:
            "Sorry there is no page on this link"
        case .unknownError:
            "Unknown error"
        }
    }
}



protocol NetworkServiceProtocol {
    func fetchInformation(with URL: URL?, completion: @escaping (Result<PlanetInformation, NetworkServiceErrors>) -> Void)
    func fetchCitizens(with URL: URL?, completion: @escaping (Result<Citizen, NetworkServiceErrors>) -> Void)
}


class NetworkServiceClass: NetworkServiceProtocol {

    // Функция ко 2-му и 3-му заданиям

    func fetchInformation(with URL: URL?, completion: @escaping (Result<PlanetInformation, NetworkServiceErrors>) -> Void) {
        guard let url = URL else { return }
        let request = URLRequest(url: url)
        let dataTask = URLSession.shared.dataTask(with: request) { data, response, error in
            if error != nil {
                completion(.failure(NetworkServiceErrors.unknownError))
            }
            if let response = response as? HTTPURLResponse {
                switch response.statusCode {
                case 200:
                    if let data = data {
                        do {
                            let decoder = JSONDecoder()
                            let planet = try decoder.decode(PlanetInformation.self, from: data)
                            completion(.success(planet))
                        } catch {
                            completion(.failure(NetworkServiceErrors.dataError))
                        }
                    }
                case 404:
                    print(NetworkServiceErrors.invalidLink.description)
                case 500:
                    print(NetworkServiceErrors.responseError.description)
                default:
                    print(NetworkServiceErrors.unknownError.description)
                }
            }
        }
        dataTask.resume()
    }

    func fetchCitizens(with URL: URL?, completion: @escaping (Result<Citizen, NetworkServiceErrors>) -> Void) {
        guard let url = URL else { return }
        let request = URLRequest(url: url)
        let dataTask = URLSession.shared.dataTask(with: request) { data, response, error in
            if error != nil {
                completion(.failure(NetworkServiceErrors.unknownError))
            }
            if let response = response as? HTTPURLResponse {
                switch response.statusCode {
                case 200:
                    if let data = data {
                        do {
                            let decoder = JSONDecoder()
                            let planet = try decoder.decode(Citizen.self, from: data)
                            completion(.success(planet))
                        } catch {
                            completion(.failure(NetworkServiceErrors.dataError))
                        }
                    }
                case 404:
                    print(NetworkServiceErrors.invalidLink.description)
                case 500:
                    print(NetworkServiceErrors.responseError.description)
                default:
                    print(NetworkServiceErrors.unknownError.description)
                }
            }
        }
        dataTask.resume()
    }
}
