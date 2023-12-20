//
//  NetworkService.swift
//  Navigation
//
//  Created by Максим Жуин on 18.12.2023.
//

import Foundation


enum AppConfiguration {
    case urlFromString(String)
    case URLFromURL(URL)
}

enum NetworkErrors: Error {
    case unknownerr
    case servererr
    case dataError

    var description: String {

        switch self {
        case .unknownerr:
            "404 error"
        case .servererr:
            "500 error"
        case .dataError:
            "Cannot create data"
        }
    }
}

struct NetworkService {

    static func request(for configuration: AppConfiguration) {
        switch configuration {
        case .urlFromString(let string):
            guard let URL = URL.init(string: string) else { return }
            fetchNetworkData(with: URL)
        case .URLFromURL(let URL):
             fetchNetworkData(with: URL)
        }
    }


   static func fetchNetworkData(with URL: URL) {

        let session = URLSession.shared

        let task = session.dataTask(with: URL) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }

            guard let httpResponse = response as? HTTPURLResponse else { return }

            print("Headers: \(httpResponse.allHeaderFields)")

            switch httpResponse.statusCode {

            case 200:

                guard let data = data else { return }

                do {

                    guard let jsonDictionary = try JSONSerialization.jsonObject(with: data) as? [String: Any] else { return }

                    print(jsonDictionary)

                } catch {
                    print(NetworkErrors.dataError.description)
                }

            case 404:
                print(NetworkErrors.unknownerr.description)
            case 500:
                print(NetworkErrors.servererr.description)
            default:
                break
            }
        }

        task.resume()
    }

}


