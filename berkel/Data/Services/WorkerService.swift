//
//  WorkerService.swift
//  berkel
//
//  Created by Onur Yilmaz on 2.11.2023.
//

import FirebaseFirestore

enum WorkerService {

    case list(season: String)
    case save(season: String)
}

extension WorkerService: CollectionServiceType {

    var order: String {
        switch self {
        case .list(_):
            return "date"
        default:
            return ""
        }
    }

    var collectionReference: CollectionReference {
        switch self {
        case .save(let season), .list(let season):

            return Firestore
                .firestore()
                .collection("data")
                .document(season)
                .collection("worker")

        }
    }
}