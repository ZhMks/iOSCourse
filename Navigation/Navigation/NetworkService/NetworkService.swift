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
    func fetchData(with URL: URL?, completion: @escaping (Result<[[String: Any]], Error>) -> Void)
    func fetchInformation<T: Decodable>(with URL: URL?, completion: @escaping (Result<T, NetworkServiceErrors>) -> Void)
}


class NetworkServiceClass: NetworkServiceProtocol {

    // Функция ко 2-му и 3-му заданиям

    func fetchInformation<T: Decodable>(with URL: URL?, completion: @escaping (Result<T, NetworkServiceErrors>) -> Void) {
        guard let url = URL else { return }
        let request = URLRequest(url: url)
        let dataTask = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(NetworkServiceErrors.unknownError))
            }
            if let response = response as? HTTPURLResponse {
                switch response.statusCode {
                case 200:
                    if let data = data {
                        do {
                            let decoder = JSONDecoder()
                            let planet = try decoder.decode(T.self, from: data)
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

    // Функция к 1-му заданию

    func fetchData(with URL: URL?, completion: @escaping (Result<[[String: Any]], Error>) -> Void) {
        guard let url = URL else { return }
        let session = URLSession.shared
        let urlRequest = URLRequest(url: url)
        let task = session.dataTask(with: urlRequest) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            guard let httpResponse = response as? HTTPURLResponse else { return }

            switch httpResponse.statusCode {

            case 200:
                if let data = data {
                    do {
                        let jsonDictionary = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed) as? [[String: Any]]
                        completion(.success(jsonDictionary!))
                    } catch {
                        print(error.localizedDescription)
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
        task.resume()
    }
}
