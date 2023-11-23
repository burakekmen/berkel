//
//  SellerService.swift
//  berkel
//
//  Created by Onur Yilmaz on 23.11.2023.
//

import FirebaseFirestore

enum SellerService {

    case save(season: String)
    case list(season: String)
}

extension SellerService: CollectionServiceType {
    
    var order: String {
        switch self {
        case .save(_), .list(_):
            return "date"
        }
    }
    
    var collectionReference: CollectionReference {
        switch self {
        case .save(let season), .list(let season):

            return Firestore
                .firestore()
                .collection("data")
                .document(season)
                .collection("seller")

        }
    }
}
