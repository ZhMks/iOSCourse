//
//  FireBaseUser.swift
//  Navigation
//
//  Created by Максим Жуин on 06.01.2024.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift


struct FireBaseUser {
    let user: User
}

struct Event: Codable {
    @DocumentID var documentID: String?
    let name: String
    let status: String
}

final class FiresService {

    let dataBase = Firestore.firestore()

    func addEvent(event: Event) {
        do {
            let documentReference = try dataBase.collection(.collectionName).addDocument(from: event) { [weak self] error in
                if let error = error {
                    print(error.localizedDescription)
                }
            }
        } catch {
            print(error.localizedDescription)
        }
    }

    func deleteEvent(event: Event, completion: @escaping (Event) -> Void ) {
        guard let documentID = event.documentID else { return }
        dataBase.collection(.collectionName).document(documentID).delete { [weak self] error in
            if let error = error {
                print(error.localizedDescription)
            }
        }
    }

    func fetchEvents(completion: @escaping (Result<Event, Error>) -> Void ) {
        dataBase.collection(.collectionName).getDocuments { snapshot, error in
            if let error = error {
                completion(.failure(error))
                print(error.localizedDescription)
            }
            let events = snapshot?.documents.compactMap({ snapshot in
                try? snapshot.data(as: Event.self)
            }).first ?? Event(name: "", status: "")
            completion(.success(events))
        }
    }
}

extension String {
    static let collectionName: String = "Events"
}
